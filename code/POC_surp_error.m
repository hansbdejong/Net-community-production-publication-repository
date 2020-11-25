% Calculates Monte Carlo error estimates - Surp(POC)

% change as appropriate
cd('C:\')

input = xlsread('POC.xlsx');
station = input(:,1);
nPOC_master = input(:,3);
depth_master = input(:,4);
density_master = input(:,5);
unique_stations = unique(station);

%##########################################################################

POC_error_summary = zeros(length(unique_stations),7);

% loop through each station
for k = 1:length(unique_stations)
    % POC, depth, and density for the hydrocast
    to_write = unique_stations(k);
    nPOC = nPOC_master(station == unique_stations(k));
    depth = depth_master(station == unique_stations(k));
    density = density_master(station == unique_stations(k));
    
    
    % creates vector with 10,000 cast integrations with +- 2 umol kg precision.
    total_integration = zeros(10000,1);  
    
    % 10000 monte carlo simulations
    for j = 1:10000 
        % new POC hydrocast vector with perturbations
        nPOC_perturbed = zeros(length(nPOC),1);   
        for i = 1:length(nPOC)
            nPOC_perturbed(i,1) = nPOC(i) + (normrnd(0,1) * 2);
        end
        
        % new POC vector in mmol per m3
        mmol_m3 = nPOC_perturbed.*density;    
        
        % vector that contains integated POC for each section: 1 m2 * height
        % of section

        nPOC_per_section = zeros(length(nPOC)-1, 1); 
        for i  = 1:length(nPOC)-1
            mean_POC = (mmol_m3(i) + mmol_m3(i+1)) / 2  ;
            depth_range = depth(i) - depth(i+1);
            nPOC_per_section(i,1) = mean_POC.*depth_range;
        end
        
        % total integration in mol / m2 (hence divide by 1000000)
        total_integration(j,1) = sum(nPOC_per_section)/1000000;
        
    end
    
    % vector for 10000 winter integrations
    total_integration_winter = zeros(10000,1);
    for j = 1:10000    
        % perturb by normal distribution with a SD of 0.6
        nPOC_winter_perturbed = 1.1 + (normrnd(0,1) * 0.6);
        nPOC_winter = repmat(nPOC_winter_perturbed, length(nPOC),1);
        
        % winter POC profile in mmol m3 for winter, create this vector
        % because the density increases with depth.
        mmol_m3 = nPOC_winter.*density;   
        
        % calculates the integrated POC between each depth range
        nPOC_per_section = zeros(length(nPOC)-1, 1);
        for i  = 1:length(nPOC)-1
            mean_POC = (mmol_m3(i)+mmol_m3(i+1))/2  ;
            depth_range = depth(i)-depth(i+1);
            nPOC_per_section(i,1) = mean_POC.*depth_range;
        end
        
        % Winter integration (density is per m^3, 200 m total, converted to
        % mole from mmol)
        total_integration_winter(j,1) = sum(nPOC_per_section)/1000000;
        
    end
    
    POC_surplus = total_integration - total_integration_winter;
    POC_mean = mean(POC_surplus);
    POC_std = std(POC_surplus);
    quantile_2point5 = quantile(POC_surplus, 0.025);
    quantile_97point5 = quantile(POC_surplus, 0.975);
    median1 = quantile(POC_surplus, 0.5);
    X = (POC_surplus - POC_mean)/POC_std;
    
    % 0 indicates a normal distribution 
    is_normal = kstest(X);  
    
    POC_error_summary (k,1) = unique_stations(k);
    POC_error_summary (k,2) = POC_mean;
    POC_error_summary (k,3) = POC_std;
    POC_error_summary (k,4) = is_normal;
    POC_error_summary (k,5) = quantile_2point5;
    POC_error_summary (k,6) = median1;
    POC_error_summary (k,7) = quantile_97point5;
    
end

filename = 'POC_error.xlsx';
xlswrite(filename, POC_error_summary)
