% Plots Figures 4 to 6 (pCO2 at the 3 hotspots), Uses M_Map

% Change as appropriate
cd('C:\')

% Loads pCO2 data
A = xlsread('1.13-2.xlsx');
day = A(:,3);
lat = A(:,5);
lon = A(:,6);
pCO2 = A(:,13);

% Extracts pCO2 from the three hot spots
pCO2_TNB = pCO2(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);
lat_TNB = lat(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);
lon_TNB = lon(lat <= -74.5 & lat >= -75.4 & lon >= 163 & lon <= 165.5);

pCO2_South = pCO2(lat <= -75.5 & lat >= -76 & lon >= 168 & lon <= 170);
lat_South = lat(lat <= -75.5 & lat >= -76 & lon >= 168 & lon <= 170);
lon_South = lon(lat <= -75.5 & lat >= -76 & lon >= 168 & lon <= 170);

pCO2_North = pCO2(lat <= -73.5 & lat >= -74.5 & lon >= 169 & lon <= 171);
lat_North = lat(lat <= -73.5 & lat >= -74.5 & lon >= 169 & lon <= 171);
lon_North = lon(lat <= -73.5 & lat >= -74.5 & lon >= 169 & lon <= 171);

%##########################################################################

% Change to M_Map directory
cd('C:\Users\Hans DeJong\Desktop\1.carbon export paper\m_map')

% Load station data
cruise_track = xlsread('track_cruise.xlsx');
lat_cruise_track = cruise_track(:,3);
lon_cruise_track = cruise_track(:,2);

B = xlsread('station map hotspot integrals.xlsx');

top_lat_1 = B(1:12, 2);
top_lon_1 = B(1:12, 3);
top_lat_2 = B(13:15, 2);
top_lon_2 = B(13:15, 3);

TNB_lat_1 = B(16:26, 2);
TNB_lon_1 = B(16:26,3);
TNB_lat_2 = B(27:30, 2);
TNB_lon_2 = B(27:30,3);

bot_lat_1 = B(31:32, 2);
bot_lon_1 = B(31:32,3);
bot_lat_2 = B(33:42, 2);
bot_lon_2 = B(33:42,3);
bot_lat_3 = B(43:49, 2);
bot_lon_3 = B(43:49,3);

TNB_track_1_lat = lat_cruise_track(9384:18024);
TNB_track_1_lon = lon_cruise_track(9384:18024);
TNB_track_2_lat = lat_cruise_track(29544:32424);
TNB_track_2_lon = lon_cruise_track(29544:32424);

top_track_1_lat = lat_cruise_track(18024:25224);
top_track_1_lon = lon_cruise_track(18024:25224);
top_track_2_lat = lat_cruise_track(30984:33863);
top_track_2_lon = lon_cruise_track(30984:33863);

bot_track_1_lat = lat_cruise_track(6504:12000);
bot_track_1_lon = lon_cruise_track(6504:12000);
bot_track_2_lat = lat_cruise_track(25224:30984);
bot_track_2_lon = lon_cruise_track(25224:30984);
bot_track_3_lat = lat_cruise_track(32424:36743);
bot_track_3_lon = lon_cruise_track(32424:36743);
%##########################################################################
% Plot TNB_1
m_proj('mercator','lon',[163 166],'lat', [-75.6 -74.4])
m_gshhs_h('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[164 165],'ytick',[-74.5 -75 -75.5],'fontsize',15)
m_gshhs_h('line','color','k')
hold on
m_plot(TNB_track_1_lon,TNB_track_1_lat,'color',[0.6 0.6 0.6],...
    'linewidth',2)
hold on
m_scatter(lon_TNB(33:1733),lat_TNB(33:1733), 120,pCO2_TNB(33:1733),...
    'fill','linewidth',5)
hold on
m_scatter(TNB_lon_1,TNB_lat_1,250,'ok','Linewidth', 2.5)
set(gca, 'CLim', [200 300]);

%Plot TNB_2
m_proj('mercator','lon',[163 166],'lat', [-75.6 -74.4])
m_gshhs_h('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[164 165],'ytick',[-74.5 -75 -75.5],'fontsize',15)
m_gshhs_h('line','color','k')
hold on
m_plot(TNB_track_2_lon,TNB_track_2_lat,'color',[0.6 0.6 0.6],...
    'linewidth',2)
hold on
m_scatter(lon_TNB(1734:1887),lat_TNB(1734:1887), 120,pCO2_TNB(1734:1887),...
    'fill','linewidth',5)
hold on
m_scatter(TNB_lon_2,TNB_lat_2,150,'ok', 'Linewidth', 2.5)

h  =  colorbar;
set(gca, 'CLim', [200 300]) 
set(gca,'FontSize',20)
set(h, 'ytick', [200 220 240 260 280 300]);
title(h,'\it{p}CO_{2} [\muatm]', 'fontsize', 15)

%##########################################################################
% Plot North_1
m_proj('mercator','lon',[169 171],'lat', [-74.5 -73.5 ])
m_gshhs_h('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[169 170 171],'ytick',[-73.5 -74 -74.5],'fontsize',15)
m_gshhs_h('line','color','k')
hold on
m_plot(top_track_1_lon,top_track_1_lat,'color',[0.6 0.6 0.6],...
    'linewidth',2)
hold on
m_scatter(lon_North(1:1395),lat_North(1:1395), 120,pCO2_North(1:1395),...
    'fill','linewidth',5)
hold on
m_scatter(top_lon_1,top_lat_1,150,'ok', 'Linewidth', 2.5)
set(gca, 'CLim', [200 300]);
set(gca,'FontSize',20)

% Plot North_2
m_proj('mercator','lon',[169 171],'lat', [-74.5 -73.5 ])
m_gshhs_h('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[169 170 171],'ytick',[-73.5 -74 -74.5],'fontsize',15)
m_gshhs_h('line','color','k')
hold on
m_plot(top_track_2_lon,top_track_2_lat,'color',[0.6 0.6 0.6],...
    'linewidth',2)
hold on
m_scatter(lon_North(1396:1581),lat_North(1396:1581), 120,...
    pCO2_North(1396:1581),'fill','linewidth',5)
hold on
m_scatter(top_lon_2,top_lat_2,150,'ok', 'Linewidth', 2.5)

h  =  colorbar;
set(gca, 'CLim', [200 300])
set(gca,'FontSize',20)
set(h, 'ytick', [200 220 240 260 280 300]);
title(h,'\it{p}CO_{2} [\muatm]', 'fontsize', 15)


%##########################################################################
% Plot South_1
m_proj('mercator','lon',[168 170],'lat', [-76 -75.5])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[168 169 170],'ytick',[-75.5 -75.75 -76],'fontsize',15)
hold on
m_plot(bot_track_1_lon,bot_track_1_lat,'color',[0.6 0.6 0.6],...
    'linewidth',2)
hold on
m_scatter(lon_South(1:128),lat_South(1:128), 120,pCO2_South(1:128),...
    'fill','linewidth',5)
hold on
m_scatter(bot_lon_1,bot_lat_1,150,'ok', 'Linewidth', 2.5)

h  =  colorbar;
set(gca, 'CLim', [200 300])
set(gca,'FontSize',20)
set(h, 'ytick', [200 220 240 260 280 300]);
title(h,'\it{p}CO_{2} [\muatm]', 'fontsize', 15)

% Plot South_2
m_proj('mercator','lon',[168 170],'lat', [-76 -75.5])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[168 169 170],'ytick',[-75.5 -75.75 -76],'fontsize',15)
hold on
m_plot(bot_track_2_lon,bot_track_2_lat,'color',[0.6 0.6 0.6],...
    'linewidth',2)
hold on
m_scatter(lon_South(159:985),lat_South(159:985), 120,...
    pCO2_South(159:985),'fill','linewidth',5)
hold on
m_scatter(bot_lon_2,bot_lat_2,150,'ok', 'Linewidth', 2.5)

h  =  colorbar;
set(gca, 'CLim', [200 300])
set(gca,'FontSize',20)
set(h, 'ytick', [200 220 240 260 280 300]);
title(h,'\it{p}CO_{2} [\muatm]', 'fontsize', 15)
 

% Plot South_3
m_proj('mercator','lon',[168 170],'lat', [-76 -75.5])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[168 169 170],'ytick',[-75.5 -75.75 -76],'fontsize',15)
hold on
m_plot(bot_track_3_lon,bot_track_3_lat,'color',[0.6 0.6 0.6],...
    'linewidth',2)
hold on
m_scatter(lon_South(986:1579),lat_South(986:1579), 120,...
    pCO2_South(986:1579),'fill','linewidth',5)
hold on
m_scatter(bot_lon_3,bot_lat_3,150,'ok', 'Linewidth', 2.5)

h  =  colorbar;
set(gca, 'CLim', [200 300])
set(gca,'FontSize',20)
set(h, 'ytick', [200 220 240 260 280 300]);
title(h,'\it{p}CO_{2} [\muatm]', 'fontsize', 15)

