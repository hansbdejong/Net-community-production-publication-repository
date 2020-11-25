% This script extracts the daily wind speeds at 10 m from the 
% NCAR wind product

% Change as appropriate
cd('C:\')

% opens netcdf files
nc2012u = netcdf.open('uwnd.10m.gauss.2012.nc','NC_NOWRITE');
nc2012v = netcdf.open('vwnd.10m.gauss.2012.nc','NC_NOWRITE');
nc2013u = netcdf.open('uwnd.10m.gauss.2013.nc','NC_NOWRITE');
nc2013v = netcdf.open('vwnd.10m.gauss.2013.nc','NC_NOWRITE');

%##########################################################################
% Explores netcdf files, can comment out.
nc = netcdf.open('uwnd.10m.gauss.2012.nc','NC_NOWRITE')
[dimname, dimlength] = netcdf.inqDim(nc, 0);  % lat, dimlength = 94
[dimname, dimlength] = netcdf.inqDim(nc, 1);  % lon, dimlength = 192
[dimname, dimlength] = netcdf.inqDim(nc, 2);  % time, dimlength = 366 (or 365)

[varname, xtype, dimid, natt] = netcdf.inqVar(nc, 3);  % 1 0 2, lon, lat, time

% prints out the lon and lat dimension steps
lon = netcdf.getVar(nc,1);
lat = netcdf.getVar(nc,0);

% Example for getting data. 3 represents the wind (u or v), 191 is 
% the longitude index, 93 is the latitude index, and 365 is the day (time)
% index.
netcdf.getVar(nc,3,[191,93,365])

%##########################################################################

% This file contains the indexes for lat and lon for the 92 hydrocast 
% stations
call = xlsread('1.wind_call_numbers.xlsx');


%##########################################################################
% u wind speed, 2012

% columns = stations, rows = daily u wind speed
u2012 = zeros(366,92);  


for j = 1:366  % loop through all the days
    for i = 1:92 % loop through all the stations
        u2012(j,i)=netcdf.getVar(nc2012u,3,[call(i,4),call(i,5),(j-1)]);
    end
end

% uncompress the data
scale_factor = ncreadatt('uwnd.10m.gauss.2012.nc','uwnd','scale_factor');
add_offset = ncreadatt('uwnd.10m.gauss.2012.nc','uwnd','add_offset');
uwind2012 = (u2012 * scale_factor) + add_offset;

% write data
filename = 'uwind2012.xlsx';
xlswrite(filename,uwind2012)

%##########################################################################
% v wind speed, 2012

v2012 = zeros(366,92);  

for j = 1:366
    for i = 1:92
        v2012(j,i)=netcdf.getVar(nc2012v,3,[call(i,4),call(i,5),(j-1)]);
    end
end

scale_factor = ncreadatt('uwnd.10m.gauss.2012.nc','uwnd','scale_factor');
add_offset = ncreadatt('uwnd.10m.gauss.2012.nc','uwnd','add_offset');
vwind2012 = (v2012*scale_factor)+add_offset

filename='vwind2012.xlsx'
xlswrite(filename,vwind2012)
%##########################################################################
% wind speed 2012 (using the u and v wind speeds)

wind2012 = sqrt((uwind2012.^2) + (vwind2012.^2));
filename = 'wind2012.xlsx';
xlswrite(filename,wind2012)

%##########################################################################
% u wind 2013

u2013 = zeros(365,92);  
for j = 1:365
    for i = 1:92
        u2013(j,i) = netcdf.getVar(nc2013u,3,[call(i,4),call(i,5),(j-1)]);
    end
end

uwind2013 = (u2013*scale_factor)+add_offset

filename = 'uwind2013.xlsx'
xlswrite(filename,uwind2013)

%##########################################################################
% v windspeed 2013

v2013 = zeros(365,92);  
for j = 1:365
    for i = 1:92
        v2013(j,i) = netcdf.getVar(nc2013v,3,[call(i,4),call(i,5),(j-1)]);
    end
end

vwind2013 = (v2013 * scale_factor) + add_offset;

filename = 'vwind2013.xlsx';
xlswrite(filename,vwind2013)

%##########################################################################
% wind speed 2013

wind2013 = sqrt((uwind2013.^2) + (vwind2013.^2));
filename = 'wind2013.xlsx';
xlswrite(filename,wind2013)

