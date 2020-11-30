% This script calculates the indices from a sea ice
% matrix for a particular lat / lon.
% it is a dynamic program finds the lat / lon that is closest to the target
% lat / lon without having to search every index

% Change 180 to 179.999 (lon) in the lat / lon file

% change as appropriate
cd('C:\')

%  Provides the longitude values 
lonGrid = double(hdfread('LongitudeLatitudeGrid-s3125-RossSea.hdf', 'Longitudes'));
latGrid = double(hdfread('LongitudeLatitudeGrid-s3125-RossSea.hdf', 'Latitudes'));

fid = xlsread('station_call_number.xlsx');

% latitudes and longitudes to calculate the sea ice grid indices (92
% stations)
station_number = fid(:,1);
lon = fid(:,2);
lat = fid(:,3);

% compute distance between the target lat / lon and a 5 x 5 grid of lat
% /lons centered at row / col
delta_row = [-2 -2 -2 -2 -2 -1 -1 -1 -1 -1 0 0 0 0 0 1 1 1 1 1 2 2 2 2 2]; 
delta_col = [-2 -1 0 1 2 -2 -1 0 1 2 -2 -1 0 1 2 -2 -1 0 1 2 -2 -1 0 1 2];

%this is just the start points to seach for the shortest distance
row = 300; 
col = 300;
deltaDIST = 100;

%###########################################################################

for i = 1:length(station_number)
    tempLat = lat(i);
    tempLat = repmat(tempLat, 25,1);
    
    tempLon = lon(i);
    tempLon = repmat(tempLon, 25,1); 
    deltaDIST = 100;
 
    while deltaDIST > 0 
        % creates a grid of 25 lats / and lons in a 5 x 5 grid, centered
        % around row / col
        for j = 1:25
            tempRow(j,1) = row + delta_row(j);
            tempCol(j,1) = col + delta_col(j);
            tempLatGrid(j,1) = latGrid(tempRow(j), tempCol(j));
            tempLonGrid(j,1) = lonGrid(tempRow(j), tempCol(j)) ;    
        end
      
        % calculates the distance between the actual lat,lon and the 25 grid points
        DIST = m_idist(tempLon,tempLat,tempLonGrid,tempLatGrid); 
      
        % finds the closest grid point
        minDIST_A = min(DIST);
        index = find(DIST == minDIST_A);
        % updates the row and col that is closer to the actual lat / lon
        row = tempRow(index);
        col = tempCol(index);
 
        % calculates new 5 x 5 grid, centered around updated row / col
        for j = 1:25
            tempRow(j,1)=row + delta_row(j);
            tempCol(j,1)=col + delta_col(j);
            tempLatGrid(j,1) = latGrid(tempRow(j), tempCol(j));
            tempLonGrid(j,1) = lonGrid(tempRow(j), tempCol(j)) ;    
        end
     
        % calculates the new distance between the actual lat,lon and the 
        % 25 grid points
        DIST = m_idist(tempLon,tempLat,tempLonGrid,tempLatGrid); 
        minDIST_B = min(DIST);
        index = find(DIST == minDIST_B);
        row = tempRow(index);
        col = tempCol(index);
        
        % key point: if the new point is the same as the old point,
        % deltaDist = 0, and you have found the clost lat / lon to the
        % target lat / lon
        deltaDIST = minDIST_A - minDIST_B ;
    end
    
    % these are the final indices
    closest_lat = latGrid(row,col);    
    closest_lon = lonGrid(row,col);  
    
 
    Output(i,1) = station_number(i);
    Output(i,2) = lon(i);
    Output(i,3) = lat(i);
    Output(i,4) = closest_lat;
    Output(i,5) = closest_lon;
    Output(i,6) = row;
    Output(i,7) = col;
    Output(i,8) = minDIST_A;

end
 

filename = 'sea_ice_call_numbers.xlsx';
xlswrite(filename, Output)

