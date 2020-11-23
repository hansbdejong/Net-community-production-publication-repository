% Plots Figure S2; Uses the M_Map library

% loads the sea ice data

% change as appropriate
cd('C:\')

Nov1_ice = double(hdfread('asi-AMSR2-s6250-20121101-v5.hdf', 'ASI Ice Concentration'));
Nov15_ice = double(hdfread('asi-AMSR2-s6250-20121115-v5.hdf', 'ASI Ice Concentration'));
Dec1_ice = double(hdfread('asi-AMSR2-s6250-20121201-v5.hdf', 'ASI Ice Concentration'));
Dec15_ice = double(hdfread('asi-AMSR2-s6250-20121215-v5.hdf', 'ASI Ice Concentration'));
Jan1_ice = double(hdfread('asi-AMSR2-s6250-20130101-v5.hdf', 'ASI Ice Concentration'));
Jan15_ice = double(hdfread('asi-AMSR2-s6250-20130115-v5.hdf', 'ASI Ice Concentration'));
Feb1_ice = double(hdfread('asi-AMSR2-s6250-20130201-v5.hdf', 'ASI Ice Concentration'));
Feb15_ice = double(hdfread('asi-AMSR2-s6250-20130215-v5.hdf', 'ASI Ice Concentration'));
Mar1_ice = double(hdfread('asi-AMSR2-s6250-20130301-v5.hdf', 'ASI Ice Concentration'));
Mar15_ice = double(hdfread('asi-AMSR2-s6250-20130315-v5.hdf', 'ASI Ice Concentration'));
Apr1_ice = double(hdfread('asi-AMSR2-s6250-20130401-v5.hdf', 'ASI Ice Concentration'));

lon_ice=double(hdfread('LongitudeLatitudeGrid-s6250-Antarctic.hdf', 'Longitudes'));
lat_ice=double(hdfread('LongitudeLatitudeGrid-s6250-Antarctic.hdf', 'Latitudes'));

lon7630= [170.0144; 172.0414; 174.0033; 176.0043; 178.0231; 180.0145];
lat7630= [-76.5; -76.5;-76.5;-76.5;-76.5;-76.5;];

% change into M_Map directory
cd('C:\')

%##########################################################################
% plot sea ice data
m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')

% change depending on which sea ice file you want to plot
h = m_pcolor(lon_ice,lat_ice,Feb15_ice);
set(h, 'EdgeColor', 'none')
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'yticklabel',[],'xticklabel',[],'xtick',[165 170 180 195],'ytick',...
    [-70 -72 -74 -76 -76.5 -78],'color',[0.5 0.5 0.5],'fontsize',15)
m_gshhs_i('line','color','k')

% custom colorbar
mycolor=[0 0 255; 8	48 107; 8 81 156;33	113	181;66 146 198;107 174 214;...
    158	202	225;198	219	239;222	235	247;247	251	255;]
mycolor2=mycolor/255
colormap(mycolor2)
m_text(160,-78.3,'15 Feb 2013','fontsize',25)

colorbar
set(gca,'fontsize', 20)

