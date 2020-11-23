% Plot Figure 3

% Change as appropriate
cd('C:\')
fid2 = xlsread('MATLAB_Hotspots.xlsx');

% Load South Site Data
julian_South = fid2(31:49,4);
NCP_South = fid2(31:49,7);
Surp_TOC_South = fid2(31:49,5);
Export_South = fid2(31:49,8);
def_N_South = fid2(31:49,6);
TOC_err = fid2(31:49,9);
N_err = fid2(31:49,10);
NCP_err = fid2(31:49,11);
Export_err = fid2(31:49,12);

%##########################################################################
%Plot Def NCP
axes('Position',[0.335, 0.76, 0.15, 0.2])
errorbar(julian_South, NCP_South, NCP_err, 'ko')
hold on
plot([48.82 68.17],[2.52 4.29], '-k', 'LineWidth',1)
ylim([0 6])
xlim([48 70])
set(gca,'xtick',[52 56 60 64 68],'xticklabel',...
    {'2/21','2/25', '3/1' '3/5', '3/9'}, 'fontsize', 10)
ylabel('mol C m^{-2}', 'fontsize',10)
box on
text(49,5.3,'(a) sNCP', 'fontsize', 10)

%##########################################################################
%Plot Def(N+N)
axes('Position',[0.535, 0.76, 0.15, 0.2]) 
errorbar(julian_South, def_N_South, N_err, 'ko')
ylim([0 1.5])
xlim([48 70])
set(gca,'xtick',[52 56 60 64 68],'xticklabel',...
    {'2/21','2/25', '3/1' '3/5', '3/9'}, 'fontsize', 10)
ylabel('mol N m^{-2}', 'fontsize',10)
box on
text(49,1.35,'(b) Def(nNO_{3}) ', 'fontsize', 10)

%##########################################################################
% Plot SurpTOC
axes('Position',[0.335, 0.49, 0.15, 0.2])
errorbar(julian_South, Surp_TOC_South, TOC_err, 'ko')

ylim([0 6])
xlim([48 70])
set(gca,'xtick',[52 56 60 64 68],'xticklabel',...
    {'2/21','2/25', '3/1' '3/5', '3/9'}, 'fontsize', 10)
ylabel('mol C m^{-2}', 'fontsize',10)
box on
text(49,5.3,'(c) Surp(TOC)', 'fontsize', 10)

%##########################################################################
% Plot EXPORT 

axes('Position',[0.535, 0.49, 0.15, 0.2])
plot([40 70],[0 0], ':k')
hold on
errorbar(julian_South, Export_South, Export_err, 'ko')
hold on
plot([48.82 68.17],[-0.39 1.56], '-k', 'LineWidth',1)

ylim([-1 6])
xlim([48 70])
set(gca,'xtick',[52 56 60 64 68],'xticklabel',...
    {'2/21','2/25', '3/1' '3/5', '3/9'}, 'fontsize', 10)
ylabel('mol C m^{-2}', 'fontsize',10)
box on
text(49,5.1,'(d) sExport_{200}', 'fontsize', 10)

%##########################################################################
% Load data and plot hydrocast profiles (sub-plot e)
axes('Position',[0.335, 0.22, 0.15, 0.2])

% Change as appropriate
cd('C:\')

station17 = xlsread('1.dNBP1302017.xlsx');
station24 = xlsread('1.dNBP1302024.xlsx');
station80 = xlsread('1.dNBP1302080.xlsx');
station81 = xlsread('1.dNBP1302081.xlsx');
station82 = xlsread('1.dNBP1302082.xlsx');
station85 = xlsread('1.dNBP1302085.xlsx');
station86 = xlsread('1.dNBP1302086.xlsx');
station88 = xlsread('1.dNBP1302088.xlsx');
station89 = xlsread('1.dNBP1302089.xlsx');
station92 = xlsread('1.dNBP1302092.xlsx');
station93 = xlsread('1.dNBP1302093.xlsx');
station95 = xlsread('1.dNBP1302095.xlsx');
station107 = xlsread('1.dNBP1302107.xlsx');
station108 = xlsread('1.dNBP1302108.xlsx');
station109 = xlsread('1.dNBP1302109.xlsx');
station110 = xlsread('1.dNBP1302110.xlsx');
station113 = xlsread('1.dNBP1302113.xlsx');
station114 = xlsread('1.dNBP1302114.xlsx');
station115 = xlsread('1.dNBP1302115.xlsx');

plot(station17(:,22),station17(:,6),'b', 'linewidth', 1.5)
hold on
plot(station24(:,22),station24(:,6),'b', 'linewidth', 1.5)
hold on
plot(station80(:,22),station80(:,6),'r', 'linewidth', 1.5)
hold on
plot(station81(:,22),station81(:,6),'r', 'linewidth', 1.5)
hold on
plot(station82(:,22),station82(:,6),'r', 'linewidth', 1.5)
hold on
plot(station85(:,22),station85(:,6),'r', 'linewidth', 1.5)
hold on
plot(station86(:,22),station86(:,6),'r', 'linewidth', 1.5)
hold on
plot(station88(:,22),station88(:,6),'r', 'linewidth', 1.5)
hold on
plot(station89(:,22),station89(:,6),'r', 'linewidth', 1.5)
hold on
plot(station92(:,22),station92(:,6),'r', 'linewidth', 1.5)
hold on
plot(station93(:,22),station93(:,6),'r', 'linewidth', 1.5)
hold on
plot(station95(:,22),station95(:,6),'r', 'linewidth', 1.5)
hold on
plot(station107(:,22),station107(:,6),'g', 'linewidth', 1.5)
hold on
plot(station108(:,22),station108(:,6),'g', 'linewidth', 1.5)
hold on
plot(station109(:,22),station109(:,6),'g', 'linewidth', 1.5)
hold on
plot(station110(:,22),station110(:,6),'g', 'linewidth', 1.5)
hold on
plot(station113(:,22),station113(:,6),'g', 'linewidth', 1.5)
hold on
plot(station114(:,22),station114(:,6),'g', 'linewidth', 1.5)
hold on
plot(station115(:,22),station115(:,6),'g', 'linewidth', 1.5)

set(gca,'YDir','Reverse', 'fontsize',10)
ylim([0 100])
xlim([26.8 28])
xlabel('\sigma_{t} [kg m^{-3}]','fontsize',10)
ylabel('Depth [m]', 'fontsize',10)


%##########################################################################
% Plot pCO2 data (sub-plot f)

% Change as appropriate
cd('C:\')
axes('Position',[0.535, 0.22, 0.15, 0.2])

A = xlsread('1.13-2.xlsx');
day = A(:,3);
lat = A(:,5);
lon = A(:,6);
pCO2 = A(:,13);

pCO2_section_S = pCO2(lat< =  -75.5 & lat> =  -76 & lon > =  168 & lon < = 170);
day_section_S = day(lat< =  -75.5 & lat> =  -76 & lon > =  168 & lon < = 170);


scatter(day_section_S(1:128), pCO2_section_S(1:128),25,'markerfacecolor',...
    'b','MarkerEdgeColor','b')
hold on
scatter(day_section_S(129:158),pCO2_section_S(129:158),25,...
    'markerfacecolor',[.6 .6 .6],'MarkerEdgeColor',[.6 .6 .6])
hold on
scatter(day_section_S(159:985),pCO2_section_S(159:985),25,...
    'markerfacecolor','r','MarkerEdgeColor','r')
hold on
scatter(day_section_S(986:1579),pCO2_section_S(986:1579),25,...
    'markerfacecolor','g','MarkerEdgeColor','g')

ylim([150 350]) 
xlim([48 70])
set(gca,'xtick',[52 56 60 64 68],'xticklabel',...
    {'2/21','2/25', '3/1' '3/5', '3/9'}, 'fontsize', 10)
box on
set(gca, 'Ytick', 150:50:300)
ylabel('\muatm', 'fontsize', 10)
