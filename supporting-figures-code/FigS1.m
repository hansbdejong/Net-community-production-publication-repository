% Plots Figure S1; Uses the M_map library

% Change as appropriate
cd('C:\')

% chlorophyll data
nov = double(hdfread('A20123062012335.L3m_MO_CHL_chlor_a_9km','l3m_data' ));
dec = double(hdfread('A20123362012366.L3m_MO_CHL_chlor_a_9km','l3m_data' ));
jan = double(hdfread('A20130012013031.L3m_MO_CHL_chlor_a_9km','l3m_data' ));
feb = double(hdfread('A20130322013059.L3m_MO_CHL_chlor_a_9km','l3m_data' ));

% removes NaNs (code -32767)
nov(nov==-32767)=NaN;
dec(dec==-32767)=NaN;
jan(jan==-32767)=NaN;
feb(feb==-32767)=NaN;

% Plot log scale
nov_log=log10(nov);
dec_log=log10(dec);
jan_log=log10(jan);
feb_log=log10(feb);


%Creates lat / lon grids

Y = 0:2159;
X = 0:4319;
incr = 360/4320;
[x,y] = meshgrid(X,Y);
chl_lat = 90 - y*incr - incr/2;
chl_lon = -180 + x*incr + incr/2;

Contours=[0.1 0.3 1 3 10];

% change to m_map directory
cd('C:\')

%-------------------------------------------------------------------------
% Plots November chlorophyll
figure('Renderer', 'Painters')
m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')
m_pcolor(chl_lon,chl_lat,nov_log);shading flat;
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],...
    'xticklabel',[],'yticklabel',[],...
'color',[0.5 0.5 0.5],'fontsize',20)
m_gshhs_i('line','color','k')

caxis(log10([Contours(1) Contours(length(Contours))]));
m_tbase('contour',[-1001:1:-1000],'edgecolor','r','LineWidth',1.5);

set(gca,'FontSize',20)

m_scatter(169.87, -74.09, 200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','b',...
              'LineWidth',2)
m_scatter(164.25, -75.1, 200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','r',...
              'LineWidth',2)
m_scatter(168.76, -75.75, 200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','g',...
              'LineWidth',2)      

lon7630 = [170.0144; 172.0414; 174.0033; 176.0043; 178.0231; 180.0145];
lat7630 = [-76.5;  -76.5;-76.5;-76.5;-76.5;-76.5;];

m_scatter(lon7630, lat7630, 100,'MarkerEdgeColor','k',...
              'MarkerFaceColor', 'k')      

%--------------------------------------------------------------------------
% Plots December Chlorophyll
figure('Renderer', 'Painters')
m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')
m_pcolor(chl_lon,chl_lat,dec_log);shading flat;
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],...
    'xticklabel',[],'yticklabel',[],...
'color',[0.5 0.5 0.5],'fontsize',20)
m_gshhs_i('line','color','k')

caxis(log10([Contours(1) Contours(length(Contours))]));
m_tbase('contour',[-1001:1:-1000],'edgecolor','r','LineWidth',1.5);

set(gca,'FontSize',20)

m_scatter(169.87, -74.09, 200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','b',...
              'LineWidth',2)
m_scatter(164.25, -75.1, 200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','r',...
              'LineWidth',2)
m_scatter(168.76, -75.75, 200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','g',...
              'LineWidth',2)      
m_scatter(lon7630, lat7630, 100,'MarkerEdgeColor','k',...
              'MarkerFaceColor', 'k')      


%--------------------------------------------------------------------------
% Plots January Chlorophyll
figure('Renderer', 'Painters')
m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')
m_pcolor(chl_lon,chl_lat,jan_log);shading flat;
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],...
    'xticklabel',[],'yticklabel',[],...
'color',[0.5 0.5 0.5],'fontsize',20)
m_gshhs_i('line','color','k')

caxis(log10([Contours(1) Contours(length(Contours))]));
m_tbase('contour',[-1001:1:-1000],'edgecolor','r','LineWidth',1.5);

set(gca,'FontSize',20)

m_scatter(169.87, -74.09, 200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','b',...
              'LineWidth',2)
m_scatter(164.25, -75.1, 200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','r',...
              'LineWidth',2)
m_scatter(168.76, -75.75, 200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','g',...
              'LineWidth',2)      
m_scatter(lon7630, lat7630, 100,'MarkerEdgeColor','k',...
              'MarkerFaceColor', 'k') 

%--------------------------------------------------------------------------
% Plots Febrary Chlorophyll
figure('Renderer', 'Painters')
m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')
m_pcolor(chl_lon,chl_lat,feb_log);shading flat;
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],...
    'xticklabel',[],'yticklabel',[],...
'color',[0.5 0.5 0.5],'fontsize',20)
m_gshhs_i('line','color','k')

caxis(log10([Contours(1) Contours(length(Contours))]));
m_tbase('contour',[-1001:1:-1000],'edgecolor','r','LineWidth',1.5);

set(gca,'FontSize',20)

m_scatter(169.87, -74.09, 200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','b',...
              'LineWidth',2)
m_scatter(164.25, -75.1, 200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','r',...
              'LineWidth',2)
m_scatter(168.76, -75.75, 200,'MarkerEdgeColor','k',...
              'MarkerFaceColor','g',...
              'LineWidth',2)      
m_scatter(lon7630, lat7630, 100,'MarkerEdgeColor','k',...
              'MarkerFaceColor', 'k') 

% Sets Colorbar
m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],...
    'xticklabel',[],'yticklabel',[],...
'color',[0.5 0.5 0.5],'fontsize',20)
m_gshhs_i('line','color','k')

colorbar('YTick',log10(Contours),'YTickLabel',Contours);
caxis(log10([Contours(1) Contours(length(Contours))]));
h = colorbar('YTick',log10(Contours),'YTickLabel',Contours);
set(gca,'FontSize',25)



