% Plots the Station maps for Figure 1
% Uses the M_map library

% Loads the data 

% Change as appropriate
cd('C:\')
A = xlsread('station map integrals.xlsx');
stat_lat = A(:,2);
stat_lon = A(:,3);

B = xlsread('station map hotspot integrals.xlsx');

% lat and lon for the stations at the 4 hot spots

top_lat = B(1:15, 2);
top_lon = B(1:15, 3);

mid_lat = B(16:30, 2);
mid_lon = B(16:30,3);

bot_lat = B(31:49, 2);
bot_lon = B(31:49,3);

lat7630 = B(50:55, 2);
lon7630 = B(50:55, 3);

cruise_track = xlsread('track_cruise.xlsx');
lat_cruise_track = cruise_track(:,3);
lon_cruise_track = cruise_track(:,2);

%##########################################################################
% Plots the figure

figure('Renderer', 'Painters')
m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-72 -74 -76 -78],'fontsize',15,...
    'yticklabel',[],'xticklabel',[],'color',[0.5 0.5 0.5])
m_gshhs_i('line','color','k')
hold on
m_plot(lon_cruise_track,lat_cruise_track,'color',[0.6 0.6 0.6],...
    'linewidth',2)
hold on
m_scatter(stat_lon,stat_lat,100,'MarkerEdgeColor','k','MarkerFaceColor',...
    [0.7 0.7 0.7],'LineWidth',.5)
m_scatter(top_lon,top_lat,200,'MarkerEdgeColor','k','MarkerFaceColor',...
    'b','LineWidth',.5)
m_scatter(mid_lon,mid_lat,200,'MarkerEdgeColor','k','MarkerFaceColor',...
    'r', 'LineWidth',.5)
m_scatter(bot_lon,bot_lat,200,'MarkerEdgeColor','k','MarkerFaceColor',...
    'g','LineWidth',.5)   
m_scatter(lon7630,lat7630,200,'MarkerEdgeColor','k','MarkerFaceColor',...
    'k','LineWidth',.5)
m_tbase('contour',[-1001:1:-1000],'edgecolor','r','LineWidth',2);
