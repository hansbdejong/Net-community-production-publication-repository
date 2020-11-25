% script calculates the air-sea CO2 flux from Nov 1 till the station
% arrival date. 

% change as appropriate
cd('C:\')

pco2 = xlsread('1.pCO2_till_station_arrival.xlsx');
SST = xlsread('1.SST_till_station_arrival.xlsx');
wind = xlsread('1.wind_till_station_arrival.xlsx');
ice = xlsread('1.ice_bremen_till_station_arrival.xlsx');
station_arrival = xlsread('station_arrival_date.xlsx');

%##########################################################################
% calculates airsea flux per day with sea ice in mmol m-2

airsea_flux = co2flux(pco2,391,wind,SST,34.5);

% factor in sea ice
open_water = (100 - ice)./100;
total_flux = open_water .* airsea_flux;

filename = 'co2flux.xlsx';
xlswrite(filename,total_flux)

% sums up the total flux at each station

station = station_arrival(:,1)
summed_flux(:,1) = station(:, 1);
summed_flux(:,2) = sum(total_flux(1:138,:));

filename='summed_flux.xlsx'
xlswrite(filename,summed_flux)
