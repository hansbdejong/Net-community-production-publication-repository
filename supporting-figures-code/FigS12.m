% Plots Figure S12 (DIC profiles, Terra Nova Bay during the second occupancy)

% Change as appropriate
cd('C:\Users\Hans DeJong\Desktop\1.carbon export paper\Quality_TNB_sampling_depths')

% Load data
Station99 = xlsread('1.dNBP1302099.xlsx');
Station100 = xlsread('1.dNBP1302100.xlsx');
Station101 = xlsread('1.dNBP1302101.xlsx');
Station102 = xlsread('1.dNBP1302102.xlsx');
Sampling_master = xlsread('DIC_NO3_sampling_depth');

SigmaT99 = Station99(:,22);
SigmaT99_depths = Station99(:,6);
SigmaT100 = Station100(:,22);
SigmaT100_depths = Station100(:,6);
SigmaT101 = Station101(:,22);
SigmaT101_depths = Station101(:,6);
SigmaT102 = Station102(:,22);
SigmaT102_depths = Station102(:,6);

DIC99_depth = Sampling_master(1:10,3);
DIC99 = Sampling_master(1:10,4);
DIC99_sigmaT = Sampling_master(1:10,7);

DIC100_depth = Sampling_master(11:30,3);
DIC100 = Sampling_master(11:30,4);
DIC100_sigmaT = Sampling_master(11:30,7);

DIC101_depth = Sampling_master(31:40,3);
DIC101 = Sampling_master(31:40,4);
DIC101_sigmaT = Sampling_master(31:40,7);

DIC102_depth = Sampling_master(41:50,3);
DIC102 = Sampling_master(41:50,4);
DIC102_sigmaT = Sampling_master(41:50,7);

%##########################################################################
% Plot A
plot(SigmaT99,SigmaT99_depths,'k', 'linewidth', 1.5)
hold on
plot(DIC99_sigmaT,DIC99_depth, 'rx', 'markersize', 15, 'linewidth', 2)
set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 300])
xlim([26.8 28])
xlabel('SigmaT [kg m^{-3}]','fontsize',15)
text(26.85, 25, '(a)', 'fontsize',15)
ylabel('Depth [m]', 'fontsize',15)


%##########################################################################
% plot C
plot(SigmaT100,SigmaT100_depths,'k', 'linewidth', 1.5)
hold on
plot(DIC100_sigmaT,DIC100_depth, 'rx', 'markersize', 15, 'linewidth', 2)
set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 300])
xlim([26.8 28])
xlabel('SigmaT [kg m^{-3}]','fontsize',15)
text(26.85, 25, '(c)', 'fontsize',15)
ylabel('Depth [m]', 'fontsize',15)

%##########################################################################
% Plot E
plot(SigmaT101,SigmaT101_depths,'k', 'linewidth', 1.5)
hold on
plot(DIC101_sigmaT,DIC101_depth, 'rx', 'markersize', 15, 'linewidth', 2)
set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 300])
xlim([26.8 28])
xlabel('SigmaT [kg m^{-3}]','fontsize',15)
text(26.85, 25, '(e)', 'fontsize',15)
ylabel('Depth [m]', 'fontsize',15)

%##########################################################################
% Plot G

plot(SigmaT102,SigmaT102_depths,'k', 'linewidth', 1.5)
hold on
plot(DIC102_sigmaT,DIC102_depth, 'rx', 'markersize', 15, 'linewidth', 2)
set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 300])
xlim([26.8 28])

xlabel('SigmaT [kg m^{-3}]','fontsize',15)
text(26.85, 25, '(g)', 'fontsize',15)
ylabel('Depth [m]', 'fontsize',15)

%##########################################################################
% Plot B

X = [2216 2216];
Y = [0 400];
X1 = [2100 2240];
Y1 = [200 200];

plot(X, Y,'color', [0.7 0.7 0.7], 'linewidth', 2)
hold on
plot(X1, Y1,'color', [0.7 0.7 0.7], 'linewidth', 2)
hold on
plot(DIC99,DIC99_depth,'k', 'linewidth', 1.5)
hold on
plot(DIC99,DIC99_depth, 'rx', 'markersize', 15, 'linewidth', 2)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 300])
xlim([2100 2240])
ylabel('Depth [m]', 'fontsize',15)
xlabel('nDIC [\mumol kg^{-1}]','fontsize',15)
text(2110,25,'(b)', 'fontsize', 15, 'horizontalalignment', 'center')

%##########################################################################
% Plot D

plot(X, Y,'color', [0.7 0.7 0.7], 'linewidth', 2)
hold on
plot(X1, Y1,'color', [0.7 0.7 0.7], 'linewidth', 2)
hold on
plot(DIC100,DIC100_depth,'k', 'linewidth', 1.5)
hold on
plot(DIC100,DIC100_depth, 'rx', 'markersize', 15, 'linewidth', 2)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 300])
xlim([2100 2240])
ylabel('Depth [m]', 'fontsize',15)
xlabel('nDIC [\mumol kg^{-1}]','fontsize',15)
text(2110,25,'(d)', 'fontsize', 15, 'horizontalalignment', 'center')

%##########################################################################
% Plot F

plot(X, Y,'color', [0.7 0.7 0.7], 'linewidth', 2)
hold on
plot(X1, Y1,'color', [0.7 0.7 0.7], 'linewidth', 2)
hold on
plot(DIC101,DIC101_depth,'k', 'linewidth', 1.5)
hold on
plot(DIC101,DIC101_depth, 'rx', 'markersize', 15, 'linewidth', 2)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 300])
xlim([2100 2240])
ylabel('Depth [m]', 'fontsize',15)
xlabel('nDIC [\mumol kg^{-1}]','fontsize',15)
text(2110,25,'(f)', 'fontsize', 15, 'horizontalalignment', 'center')

%##########################################################################
% Plot H

plot(X, Y,'color', [0.7 0.7 0.7], 'linewidth', 2)
hold on
plot(X1, Y1,'color', [0.7 0.7 0.7], 'linewidth', 2)
hold on
plot(DIC102,DIC102_depth,'k', 'linewidth', 1.5)
hold on
plot(DIC102,DIC102_depth, 'rx', 'markersize', 15, 'linewidth', 2)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 300])
xlim([2100 2240])
ylabel('Depth [m]', 'fontsize',15)
xlabel('nDIC [\mumol kg^{-1}]','fontsize',15)
text(2110,25,'(h)', 'fontsize',15, 'horizontalalignment', 'center')

