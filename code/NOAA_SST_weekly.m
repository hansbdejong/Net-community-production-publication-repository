% This script extracts the week SST values from the 
% NOAA SST product

% change as appropriate
cd('C:\')

%##########################################################################
% open and explore the netcdf file
nc = netcdf.open('sst.wkmean.1990-present.nc','NC_NOWRITE');

% displays details about this netcdf file
ncdisp('sst.wkmean.1990-present.nc')

[dimname, dimlength] = netcdf.inqDim(nc, 0); % lat, dimLength = 180 
[dimname, dimlength] = netcdf.inqDim(nc, 1); % lon, dimLength = 360 
[dimname, dimlength] = netcdf.inqDim(nc, 2); % time, dimLength = 1269

% prints out the lon, lat, and time dimension steps
lon = netcdf.getVar(nc,1);
lat = netcdf.getVar(nc,0);
time = netcdf.getVar(nc,3);

% converts datetime to datestr format
dj = datenum(1800,1,1);
date = cell(1269,1);
for i = 1:1269
    date{i}=datestr(dj +  time(i));
end

% Extract SST data with lon index, lat index, and time index, e.g. 
sst = netcdf.getVar(nc,2,[180 179 1268]);

%##########################################################################
% Extract SST data

% contains the lat and lon indexes for all 92 hydrocast stations
station = xlsread('station_call_number.xlsx')

% contains the indexes for all the dates
date = xlsread('date_call_number.xlsx')

% columns = stations, rows = temperature for that day (weekly average)
output=zeros(143,92);  


for j=1:143 % loops through the days
    for i=1:92 % loops through the stations
        output(j,i)=netcdf.getVar(nc,2,[station(i,4),station(i,5),date(j)]);
    end
end

% unpack the data
scale_factor = ncreadatt('sst.wkmean.1990-present.nc','sst','scale_factor');
add_offset = ncreadatt('sst.wkmean.1990-present.nc','sst','add_offset');

% formula used, add_offset in this case is 0
unpacked_data = ( packed_data * scale_factor ) + add_offset;

scale_factor = repmat(scale_factor, 143, 92);
sst = output .* scale_factor;

% write file
filename = 'sst.xlsx';
xlswrite(filename,sst)

filename = 'station_trans.xlsx';
xlswrite(filename,station_t)

