% This script extracts the daily values from the 
% Bremen sea ice product

% creates the directory for the daily sea ice files for the particular
% month

% change as appropriate
cd('C:\')
dir_content = dir('C:\*hdf*');
A = {dir_content.name};


% contains the lat and lon indexes (to extract sea ice) 
%for all 92 hydrocast stations

fid = xlsread('station_call_number.xlsx');
lon = fid(:,4);
lat = fid(:,5);

% each column represents the 92 stations, each row represents the day 
% in a particular month
ice = zeros(31, 92);

% loops through each daily sea ice file
for i = 1:31                  
init = char(A(i));
file = double(hdfread(init, 'ASI Ice Concentration'));
    
    % loops through each station
    for j = 1:92   
        ice(i, j) = file(lon(j), lat(j));
    end
end

% outputs sea ice for that month
filename = 'Dec_ice_test.xlsx';
xlswrite(filename,ice)
