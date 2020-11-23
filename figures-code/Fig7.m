% Plot Figure 7

% Change as appropriate
cd('C:\')

% Load data
file = xlsread('1.wind_NBP1302.xlsx')
julian = file(1:41054,1);
wind = file(1:41054,9);
lat = file(1:41054,7);
lon = file(1:41054,8);
wind = wind*0.91;

% Extract wind data from specified areas
wind_TNB = wind(lat <= -74.5 & lat >= -75.5 & lon >= 163 & lon <= 165);
wind_south = wind(lat <= -75.5 & lat >= -76 & lon >= 168 & lon <= 170);
wind_north = wind(lat <= -73.5 & lat >= -74.5 & lon >= 169 & lon <= 171);
wind_transect = wind(lat <= -76 & lat >= -77 & lon >= 170 & lon <= 180);

julian_TNB = julian(lat <= -74.5 & lat >= -75.5 & lon >= 163 & lon <= 165);
julian_south = julian(lat <= -75.5 & lat >= -76 & lon >= 168 & lon <= 170);
julian_north = julian(lat <= -73.5 & lat >= -74.5 & lon >= 169  & lon <= 171);
julian_transect = julian(lat <= -76 & lat >= -77 & lon >= 170 & lon <= 180);

% Plot data
plot(julian,wind,'o', 'markeredgecolor', [0.7 0.7 0.7], 'markerfacecolor',...
    [0.7 0.7 0.7], 'markersize', 4)
    hold on
h1 = plot(julian_TNB,wind_TNB,'o', 'markeredgecolor', 'r', 'markerfacecolor',...
    'r', 'markersize', 4);
    hold on
h2 = plot(julian_north,wind_north,'o', 'markeredgecolor', 'b',...
    'markerfacecolor', 'b', 'markersize', 4);
    hold on
h3 = plot(julian_south,wind_south,'o', 'markeredgecolor', 'g',...
    'markerfacecolor', 'g', 'markersize', 4);
    hold on
h4 = plot(julian_transect,wind_transect,'o', 'markeredgecolor', 'k',...
    'markerfacecolor', 'k', 'markersize', 4);
ylim([40 75])
ylim([0 30])
set(gca,'xtick',[41 51 60 69],'xticklabel',{'2/10' '2/20' '3/1' '3/10'})
set(gca,'ytick',[5 10 15 20 25 30])
set(gca,'FontSize',18)
ylabel('Wind Speed [m s^{-1}]', 'fontsize',18)
xlabel('Month/Day', 'fontsize', 18)
legend([h3 h1 h2 h4],'South','TNB', 'North', 'Transect')
