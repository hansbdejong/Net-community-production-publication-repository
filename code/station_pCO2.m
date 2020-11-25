% This script extracts the pCO2 from a grid then calculates 10 day average
% pCO2 values to estimate the pCO2 time series before station arrival

% Change as appropriate
cd('C:\')

% loads data
fid = xlsread('pCO2merged.xlsx'); % 306,000 lines of data
day = fid(:,3);
lat = fid(:,5);
lon = fid(:,6);
pCO2 = fid(:,13);

% grid cell represents the TOP LEFT CORNER
% lat inteval = 1, lon interval = 2 (odd longitudes, 167, 169, ...)
lat_input = -73;
lon_input = 169;

% extract the pCO2 data and the day of year
pCO2_section = pCO2(lat <= lat_input & lat >= (lat_input - 1) &...
    lon >= lon_input & lon <=lon_input + 2);
day_section = day(lat <= lat_input & lat >= (lat_input-1)...
    & lon >= lon_input & lon <= lon_input+2);

% sets up the output file, with DOY labelled (through 371)
% since the bin edges interval is 10, to include beyond day 361, we 
% must include day 371, even though that DOY does not exist
binMean = zeros(371,3);
for k = 1:371
    binMean(k,1)=k;
end

% getting the binned averages into bin_vector. Each bin includes 10 days
% For example, if binranges equals the vector [0,5,10,13], then histc creates four bins. 
% The first bin includes values greater than or equal to 0 and strictly less than 5. The 
% second bin includes values greater than or equal to 5 and less than 10, and so on. 
% The last bin contains the scalar value 13.
binEdges = (1:10:371);

% whichBin is the bin number for the input value (vector of day of year)
[h,whichBin]=histc(day_section, binEdges);

% averages the pCO2 in each bin
for i = 1:length(binEdges)
    flagBinMembers = (whichBin == i); 
    binMembers = pCO2_section(flagBinMembers); % pCO2 values for that bin
    bin_average = mean(binMembers); % NaN if there are no pCO2 for that bin
    
    % add the data into the binMean matrix
    first_day_of_bin = (i-1)*10 + 1;
    binMean(first_day_of_bin, 2) = bin_average;
    for j= 0:9
        % adds the average for all 10 days
        binMean(first_day_of_bin + j,3)= bin_average;
    end
end

% sanity check
plot(day_section,pCO2_section,'ok')
hold on
plot(binMean(:,1),binMean(:,3),'r')
xlim([0 365])
    
filename = '1.binMean.xlsx';
xlswrite(filename,binMean)

