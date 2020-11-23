%Plots Figure 4

% Change as appropriate
cd('C:\')

fid2 = xlsread('MATLAB_Hotspots.xlsx');

% Load data from Terra Nova Bay

julian_TNB = fid2(16:30,4);
NCP_TNB = fid2(16:30,7);
Surp_TOC_TNB = fid2(16:30,5);
Export_TNB = fid2(16:30,8);
def_N_TNB = fid2(16:30,6);
TOC_err = fid2(16:30,9);
N_err = fid2(16:30,10);
NCP_err = fid2(16:30,11);
Export_err = fid2(16:30,12);

%##########################################################################
%Plot Def NCP
axes('Position',[0.335, 0.76, 0.15, 0.2])  
errorbar(julian_TNB, NCP_TNB, NCP_err, 'ko')
hold on
plot([50.88 65.32],[4.1 10.3], '-k', 'LineWidth',1)
ylim([0 13])
xlim([48 68])
set(gca,'xtick',[52 56 60 64],'xticklabel',{'2/21','2/25', '3/1' '3/5'},...
    'fontsize', 10)
ylabel('mol C m^{-2}', 'fontsize',10)
box on
text(49,12,'(a) sNCP', 'fontsize', 10)

%##########################################################################
% Plot Def(N+N)
axes('Position',[0.535, 0.76, 0.15, 0.2]) 
errorbar(julian_TNB, def_N_TNB, N_err, 'ko')
hold on
plot([50.88 65.32],[0.87 2.03], '-k', 'LineWidth',1)
ylim([0 2.5])
xlim([48 68])
set(gca,'xtick',[52 56 60 64],'xticklabel',{'2/21','2/25', '3/1' '3/5'},...
    'fontsize', 10)
ylabel('mol N m^{-2}', 'fontsize',10)
box on
text(49,2.25,'(b) Def(nNO_{3}) ', 'fontsize', 10)

%##########################################################################
% Plot SurpTOC
axes('Position',[0.335, 0.49, 0.15, 0.2])
errorbar(julian_TNB, Surp_TOC_TNB, TOC_err, 'ko')
hold on

ylim([0 13])
xlim([48 68])
set(gca,'xtick',[52 56 60 64],'xticklabel',{'2/21','2/25', '3/1' '3/5'},...
    'fontsize', 10)
ylabel('mol C m^{-2}', 'fontsize',10)
box on
text(49,12,'(c) Surp(TOC)', 'fontsize', 10)

%##########################################################################
%Plot EXPORT 

axes('Position',[0.535, 0.49, 0.15, 0.2])
plot([40 70],[0 0], ':k')
hold on
errorbar(julian_TNB, Export_TNB, Export_err, 'ko')
hold on
plot([50.88 65.32],[1.3 7.3], '-k', 'LineWidth',1)

ylim([-1.5 13])
xlim([48 68])
set(gca,'xtick',[52 56 60 64],'xticklabel',{'2/21','2/25', '3/1' '3/5'},...
    'fontsize', 10)
ylabel('mol C m^{-2}', 'fontsize',10)
box on
text(49,11.5,'(d) sExport_{200} ', 'fontsize', 10)

%##########################################################################
% Loads pCO2 data

% Change as appropriate
cd('C:\')
A = xlsread('1.13-2.xlsx');
day = A(:,3);
lat = A(:,5);
lon = A(:,6);
pCO2 = A(:,13);

pCO2_section_T = pCO2(lat <= -74.5 & lat >= -75.5 & lon >= 163 & lon <= 165);
day_section_T = day(lat <= -74.5 & lat >= -75.5 & lon >= 163 & lon <= 165);

% Loads station hydrocast data for Terra Nova Bay

% Change as appropriate
cd('C:\')

station27 = xlsread('1.dNBP1302027.xlsx');
station28 = xlsread('1.dNBP1302028.xlsx');
station29 = xlsread('1.dNBP1302029.xlsx');
station30 = xlsread('1.dNBP1302030.xlsx');
station33 = xlsread('1.dNBP1302033.xlsx');
station34 = xlsread('1.dNBP1302034.xlsx');
station37 = xlsread('1.dNBP1302037.xlsx');
station39 = xlsread('1.dNBP1302039.xlsx');
station40 = xlsread('1.dNBP1302040.xlsx');
station44 = xlsread('1.dNBP1302044.xlsx');
station48 = xlsread('1.dNBP1302048.xlsx');
station99 = xlsread('1.dNBP1302099.xlsx');
station100 = xlsread('1.dNBP1302100.xlsx');
station101 = xlsread('1.dNBP1302101.xlsx');
station102 = xlsread('1.dNBP1302102.xlsx');


%#########################################################################% 
% Plots Panel e

axes('Position',[0.335, 0.22, 0.15, 0.2])

plot(station27(:,22),station27(:,6),'b', 'linewidth', 1.5)
hold on
plot(station28(:,22),station28(:,6), 'b', 'linewidth', 1.5)
hold on
plot(station29(:,22),station29(:,6), 'b', 'linewidth', 1.5)
hold on
plot(station30(:,22),station30(:,6), 'b', 'linewidth', 1.5)
hold on
plot(station37(:,22),station37(:,6), 'b', 'linewidth', 1.5)
hold on
plot(station39(:,22),station39(:,6),  'b', 'linewidth', 1.5)
hold on
plot(station40(:,22),station40(:,6),'b', 'linewidth', 1.5)
hold on
plot(station44(:,22),station44(:,6),'b', 'linewidth', 1.5)
hold on
plot(station48(:,22),station48(:,6),'b', 'linewidth', 1.5)
hold on
plot(station99(:,22),station99(:,6),'r', 'linewidth', 1.5)
hold on
plot(station100(:,22),station100(:,6),'r', 'linewidth', 1.5)
hold on
plot(station101(:,22),station101(:,6),'r', 'linewidth', 1.5)
hold on
plot(station102(:,22),station102(:,6),'r', 'linewidth', 1.5)
hold on

set(gca,'YDir','Reverse', 'fontsize',10)
ylim([0 300])
xlim([26.8 28])
xlabel('\sigma_{t} [kg m^{-3}]','fontsize',10)
ylabel('Depth [m]', 'fontsize',10)

%##########################################################################

%Panel F
axes('Position',[0.535, 0.22, 0.15, 0.2])

scatter(day_section_T,pCO2_section_T,25,'markerfacecolor','b',...
    'MarkerEdgeColor','b')
hold on
scatter(day_section_T(1586:1719),pCO2_section_T(1586:1719),25,...
    'markerfacecolor','r','MarkerEdgeColor','r')
ylim([150 400]) 
xlim([48 68])
set(gca,'xtick',[52 56 60 64],'xticklabel',{'2/21','2/25', '3/1' '3/5'},...
    'fontsize', 10) 
box on
set(gca, 'Ytick', 150:50:350)
ylabel('\muatm', 'fontsize', 10)
