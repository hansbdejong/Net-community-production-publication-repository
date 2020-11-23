% Plots the sea ice data for Figure 1; uses the M_map library

% change as appropriate
cd('C:\')

% Loads sea ice data
Mar18_ice = double(hdfread('asi-AMSR2-s6250-20130318-v5.hdf', 'ASI Ice Concentration'));
Feb12_ice = double(hdfread('asi-AMSR2-s6250-20130212-v5.hdf', 'ASI Ice Concentration'));

lon_ice = double(hdfread('LongitudeLatitudeGrid-s6250-Antarctic.hdf', 'Longitudes'));
lat_ice = double(hdfread('LongitudeLatitudeGrid-s6250-Antarctic.hdf', 'Latitudes'));

% Change into the directory with M_map
cd('C:\')

%##########################################################################
% Plots Panel A

figure('Renderer', 'Painters')
m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')
h=m_pcolor(lon_ice,lat_ice,Feb12_ice)
set(h, 'EdgeColor', 'none')
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'yticklabel',[],'xticklabel',[],'xtick',[165 180 195],'ytick',...
    [-70 -72 -74 -76 -78],'color',[0.5 0.5 0.5],'fontsize',15)
m_gshhs_i('line','color','k')

% custom colorbar
mycolor = [0 0 255;8 48 107; 8 81 156;33 113 181;66	146	198;107	174	214;...
    158 202	225;198	219	239;222	235	247;247	251	255;];
mycolor2 = mycolor/255;
colormap(mycolor2)

%#########################################################################

% Plots panel B

figure('Renderer', 'Painters')
m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')
h = m_pcolor(lon_ice,lat_ice,Mar18_ice);
set(h, 'EdgeColor', 'none')
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in','xtick',...
    [165 180 195],'ytick',[-70 -72 -74 -76 -78],'yticklabel',[],...
    'xticklabel',[],'color',[0.5 0.5 0.5],'fontsize',15)
m_gshhs_i('line','color','k')

mycolor = [0 0 255;8 48 107; 8 81 156;33 113 181;66	146	198;107	174	214;...
    158 202	225;198	219	239;222	235	247;247	251	255;];
mycolor2 = mycolor/255;
colormap(mycolor2)

%##########################################################################
%run this code after the plot comes up
h = colorbar;
set(gca,'FontSize',25)
%##########################################################################

