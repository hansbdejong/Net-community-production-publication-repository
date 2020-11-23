% Plots Figure S10 - POC profiles

% Change as appropriate
cd('C:\')

% Loads data
north = xlsread('POC_N.xlsx');
south = xlsread('POC_S.xlsx');
TNB = xlsread('POC_T.xlsx');
transect = xlsread('POC_L.xlsx');
JGOFS = xlsread('POC_JGOFS_summer_7630.xlsx');

depth_n = north(:,1);
depth_s = south(:,1);
depth_TNB = TNB(:,1);
depth_transect = transect(:,1);
depth_JGOFS = JGOFS(:,1);

POC_n = north(:,2);
POC_s = south(:,2);
POC_TNB = TNB(:,2);
POC_transect = transect(:,2);
POC_JGOFS = JGOFS(:,2);

%##########################################################################
% Plots data
scatter(POC_JGOFS, depth_JGOFS,50, 'MarkerEdgeColor','k', 'linewidth', 1)
set(gca,'YDir','Reverse','XAxisLocation','top')
ylabel('Depth [m]', 'fontsize',12)
xlabel('POC [\mumol L^{-1}]','fontsize',12)
box on
set(gca, 'fontsize', 13, 'ytick', [50:50:200], 'xtick', [0:20:100])
xlim([0 120])
ylim([0 200])

text(2.5,12,'(e)', 'horizontalalignment','left','fontsize', 15)
text(40, 125,'JGOFS Transect, Summer', 'horizontalalignment','left','fontsize', 15)
