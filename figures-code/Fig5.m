% Plot Figure 5

% Change as appropriate
cd('C:\')
fid2 = xlsread('MATLAB_Hotspots.xlsx');

% Load North site data
julian_North = fid2(1:15,4);
NCP_North = fid2(1:15,7);
Surp_TOC_North = fid2(1:15,5);
Export_North = fid2(1:15,8);
def_N_North = fid2(1:15,6);
TOC_err = fid2(1:15,9);
N_err = fid2(1:15,10);
NCP_err = fid2(1:15,11);
Export_err = fid2(1:15,12);

%##########################################################################
% Plot Def NCP
axes('Position',[0.335, 0.76, 0.15, 0.2])  
errorbar(julian_North, NCP_North, NCP_err, 'ko')
hold on
plot([56.78 66.23],[3.01 5.22], '-k', 'LineWidth',1)
ylim([0 6])
xlim([52 68])
set(gca,'xtick',[56 60 64],'xticklabel',{'2/25', '3/1' '3/5'}, 'fontsize', 10)
ylabel('mol C m^{-2}', 'fontsize',10)
box on
text(53,5.3,'(a) sNCP', 'fontsize', 10)


%##########################################################################
% Plot Def(N+N)
axes('Position',[0.535, 0.76, 0.15, 0.2]) 
errorbar(julian_North, def_N_North, N_err, 'ko')
ylim([0 2])
xlim([52 68])
set(gca,'xtick',[56 60 64],'xticklabel',{'2/25', '3/1' '3/5'}, 'fontsize', 10)
ylabel('mol N m^{-2}', 'fontsize',10)
box on
text(53,1.75,'(b) Def(nNO_{3})', 'fontsize', 10)

%##########################################################################
% Plot SurpTOC
axes('Position',[0.335, 0.49, 0.15, 0.2])
errorbar(julian_North, Surp_TOC_North, TOC_err, 'ko')
hold on
plot([56.78 66.23],[3.23 2.48], '-k', 'LineWidth',1)
ylim([0 6])
xlim([52 68])
set(gca,'xtick',[56 60 64],'xticklabel',{'2/25', '3/1' '3/5'}, 'fontsize', 10)
ylabel('mol C m^{-2}', 'fontsize',10)
box on
text(53,5.3,'(c) Surp(TOC)', 'fontsize', 10)


%##########################################################################
% Plot EXPORT 

axes('Position',[0.535, 0.49, 0.15, 0.2])
plot([40 70],[0 0], ':k')
hold on
errorbar(julian_North, Export_North, Export_err, 'ko')
hold on
plot([56.78 66.23],[-0.24 2.74], '-k', 'LineWidth',1)
ylim([-2 6])
xlim([52 68])
set(gca,'xtick',[56 60 64],'xticklabel',{'2/25', '3/1' '3/5'}, 'fontsize', 10)
ylabel('mol C m^{-2}', 'fontsize',10)
box on
text(53,4.9,'(d) sExport_{200}', 'fontsize', 10)

%##########################################################################
% Load hydrocast data

% Change as approriate
cd('C:\')
axes('Position',[0.335, 0.22, 0.15, 0.2])
station55 = xlsread('1.dNBP1302055.xlsx');
station56 = xlsread('1.dNBP1302056.xlsx');
station57 = xlsread('1.dNBP1302057.xlsx');
station58 = xlsread('1.dNBP1302058.xlsx');
station63 = xlsread('1.dNBP1302063.xlsx');
station66 = xlsread('1.dNBP1302066.xlsx');
station67 = xlsread('1.dNBP1302067.xlsx');
station68 = xlsread('1.dNBP1302068.xlsx');
station70 = xlsread('1.dNBP1302070.xlsx');
station73 = xlsread('1.dNBP1302073.xlsx');
station74 = xlsread('1.dNBP1302074.xlsx');
station75 = xlsread('1.dNBP1302075.xlsx');
station103 = xlsread('1.dNBP1302103.xlsx');
station104 = xlsread('1.dNBP1302104.xlsx');
station106 = xlsread('1.dNBP1302106.xlsx');

% Plot hydrocast data
plot(station55(:,22),station55(:,6),'b', 'linewidth', 1.5)
hold on
plot(station56(:,22),station56(:,6),'b', 'linewidth', 1.5)
hold on
plot(station57(:,22),station57(:,6),'b', 'linewidth', 1.5)
hold on
plot(station58(:,22),station58(:,6),'b', 'linewidth', 1.5)
hold on
plot(station63(:,22),station63(:,6),'b', 'linewidth', 1.5)
hold on
plot(station67(:,22),station67(:,6),'b', 'linewidth', 1.5)
hold on
plot(station68(:,22),station68(:,6),'b', 'linewidth', 1.5)
hold on
plot(station70(:,22),station70(:,6),'b', 'linewidth', 1.5)
hold on
plot(station73(:,22),station73(:,6),'b', 'linewidth', 1.5)
hold on
plot(station74(:,22),station74(:,6),'b', 'linewidth', 1.5)
hold on
plot(station75(:,22),station75(:,6),'b', 'linewidth', 1.5)
hold on
plot(station103(:,22),station103(:,6),'r', 'linewidth', 1.5)
hold on
plot(station104(:,22),station104(:,6),'r', 'linewidth', 1.5)
hold on
plot(station106(:,22),station106(:,6),'r', 'linewidth', 1.5)

set(gca,'YDir','Reverse', 'fontsize',10)
ylim([0 200])
xlim([26.8 28])
xlabel('\sigma_{t} [kg m^{-3}]','fontsize',10)
text(27.83, 20, '(e)', 'fontsize',10)
ylabel('Depth [m]', 'fontsize',10)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load pCO2 data

% Change as appropriate
cd('C:\')
axes('Position',[0.535, 0.22, 0.15, 0.2])

A = xlsread('1.13-2.xlsx');
day = A(:,3);
lat = A(:,5);
lon = A(:,6);
pCO2 = A(:,13);

pCO2_section_N = pCO2(lat <= -73.5 & lat >= -74.5 & lon >=  169 & lon <= 171);
day_section_N = day(lat <= -73.5 & lat >= -74.5 & lon >= 169 & lon <= 171);

scatter(day_section_N,pCO2_section_N,25,'markerfacecolor','b','MarkerEdgeColor','b')
hold on
scatter(day_section_N(1396:1581),pCO2_section_N(1396:1581),25,...
    'markerfacecolor','r','MarkerEdgeColor','r')
ylim([150 400]) 
xlim([52 68])
set(gca,'xtick',[56 60 64],'xticklabel',{'2/25', '3/1' '3/5'}, 'fontsize', 10)

box on
set(gca, 'Ytick', 150:50:350)
text(53, 370, '(f) pCO_{2} ', 'fontsize',10)
ylabel('\muatm', 'fontsize', 10)
