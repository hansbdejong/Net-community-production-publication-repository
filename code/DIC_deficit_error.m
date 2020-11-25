% Calculates Monte Carlo error estimates - Def(nDIC)

% change as appropriate
cd('C:\')

input = xlsread('DIC_Transect.xlsx');
station = input(:,1);
nDIC_master = input(:,3);
depth_master = input(:,4);
density_master = input(:,5);
unique_stations = unique(station);
%##########################################################################

DIC_error_summary = zeros(length(unique_stations),7);

% loop through each station
for k = 1:length(unique_stations)
    %DIC, depth, and density for the hydrocast
    to_write = unique_stations(k);
    nDIC = nDIC_master(station == unique_stations(k));
    depth = depth_master(station == unique_stations(k));
    density = density_master(station == unique_stations(k));
    
    %creates vector with 10,000 cast integrations with +- 3 umol kg precision.
    
    %total DIC integration to 200 m depth
    total_integration = zeros(10000,1);  
    
    for j = 1:10000    
        % DIC perturbed vector
        nDIC_perturbed = zeros(length(nDIC),1);  
        
        % adjust each DIC value for that hydrocast by +- normal
        % distribution (with a SD of 3) 
        for i = 1:length(nDIC)
            nDIC_perturbed(i,1) = nDIC(i)+ (normrnd(0,1)*(3));
        end
        
        % new DIC vector in mmol per m3
        mmol_m3 = nDIC_perturbed.*density;
        
        %vector that contains integated DIC for each section (1 m2 * height
        %of section)
        nDIC_per_section = zeros(length(nDIC)-1, 1); 
        
        % calculate the integrated DIC between each depth range
        for i = 1:length(nDIC) - 1
            mean_DIC = (mmol_m3(i) + mmol_m3(i+1))/2;
            depth_range = depth(i) - depth(i+1);
            nDIC_per_section(i,1) = mean_DIC.*depth_range;
        end
        
        % convert to moles / m2
        total_integration(j,1) = sum(nDIC_per_section)/1000000;
        
    end
    
    % calculate vector (10000 long) for winter integrations
    total_integration_winter = zeros(10000,1);
    for j = 1:10000
        
        % adjust the winter DIC value by +- normal distribution with a SD
        % of 3
        nDIC_winter_perturbed = 2223 + (normrnd(0,1) * 3);
        nDIC_winter = repmat(nDIC_winter_perturbed, length(nDIC),1);
        
        % winter DIC profile in mmol m3 for winter, create this vector
        % because the density increases with depth.
        mmol_m3 = nDIC_winter.*density;   
        
        % calculate the integrated DIC between each depth range
        nDIC_per_section = zeros(length(nDIC)-1, 1);
        for i = 1:length(nDIC)-1
            mean_DIC = (mmol_m3(i)+mmol_m3(i+1))/2  ;
            depth_range = depth(i)-depth(i+1);
            nDIC_per_section(i,1) = mean_DIC.*depth_range;
        end
        
        % Winter integration (density is per m^3, 200 m total, converted to
        % mole from mmol)
        total_integration_winter(j,1) = sum(nDIC_per_section)/1000000;      
    end
     
    DIC_deficit = total_integration_winter - total_integration;
    mean_DIC_deficit = mean(DIC_deficit);
    std_DIC_deficit = std(DIC_deficit);
    quantile_2point5 = quantile(DIC_deficit, 0.025);
    quantile_97point5 = quantile(DIC_deficit, 0.975);
    median_DIC_deficit = quantile(DIC_deficit, 0.5);
    X = (DIC_deficit - mean_DIC_deficit)/std_DIC_deficit;
    
    % 0 indicates a normal distribution 
    is_normal = kstest(X); 

    DIC_error_summary(k,1) = unique_stations(k);
    DIC_error_summary(k,2) = mean_DIC_deficit;
    DIC_error_summary(k,3) = std_DIC_deficit;
    DIC_error_summary(k,4) = is_normal;
    DIC_error_summary(k,5) = quantile_2point5;
    DIC_error_summary(k,6) = median_DIC_deficit;
    DIC_error_summary(k,7) = quantile_97point5;   
end

filename = 'DIC_Transect_error.xlsx'
xlswrite(filename, DIC_error_summary)

