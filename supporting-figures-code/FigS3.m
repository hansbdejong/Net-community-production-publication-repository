% Plots Figure 3 (Mixed Layer Depths

% Change as appropriate
cd('C:\')
Station34 = xlsread('1.dNBP1302034.xlsx'); %TNB
Station106 = xlsread('1.dNBP1302106.xlsx'); %North
Station086 = xlsread('1.dNBP1302086.xlsx'); %South
Station121 = xlsread('1.dNBP1302102.xlsx'); %transect

% densities vs depth
SigmaT34 = Station34(:,22);
SigmaT34_depths = Station34(:,6);

SigmaT106 = Station106(:,22);
SigmaT106_depths = Station106(:,6);

SigmaT086 = Station086(:,22);
SigmaT086_depths = Station086(:,6);

SigmaT121 = Station121(:,22);
SigmaT121_depths = Station121(:,6);

%##########################################################################
% Plots South Site
YS_1 = [29 29];
YS_2 = [30 30];
YS_3 = [31 31];
XS = [27.4 28];

figure
plot(SigmaT086,SigmaT086_depths,'k', 'linewidth', 1.5)
hold on
h1 = plot(XS, YS_1,'r', 'linewidth', 1);
hold on
h2 = plot(XS, YS_2,'--r', 'linewidth', 2);
hold on
h3 = plot(XS, YS_3,'r', 'linewidth', 3);

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([18 40])
xlim([27.4 27.9])
legend([h1 h2 h3],'\sigma_{t}>0.02', '\sigma_{t}>0.05','\sigma_{t}>0.125',...
    'location', 'southwest')

xlabel('\sigma_{t} [kg m^{-3}]','fontsize',15)
ylabel('Depth [m]', 'fontsize',15)
text(27.45, 19.5, 'South', 'fontsize', 15)
text(27.85, 19.5, '(a)', 'fontsize', 15)

%##########################################################################
% Plots TNB

YTNB_1 = [19 19];
YTNB_2 = [39 39];
YTNB_3 = [88 88];
XTNB = [27 28];

figure
plot(SigmaT34,SigmaT34_depths,'k', 'linewidth', 1.5)
hold on
h1 = plot(XTNB, YTNB_1,'r', 'linewidth', 1);
hold on
h2 = plot(XTNB, YTNB_2,'--r', 'linewidth', 2);
hold on
h3 = plot(XTNB, YTNB_3,'r', 'linewidth', 3);

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 150])
xlim([27.1 28])

xlabel('\sigma_{t} [kg m^{-3}]','fontsize',15)
ylabel('Depth [m]', 'fontsize',15)
text(27.3, 11, 'TNB', 'fontsize', 15)
text(27.92, 11, '(b)', 'fontsize', 15)

%##########################################################################
% Plots North Site
YN_1 = [16 16];
YN_2 = [44 44];
YN_3 = [54 54];
XN = [27 28];

figure
plot(SigmaT106,SigmaT106_depths,'k', 'linewidth', 1.5)
hold on
h1 = plot(XN, YN_1,'r', 'linewidth', 1);
hold on
h2 = plot(XN, YN_2,'--r', 'linewidth', 2);
hold on
h3 = plot(XN, YN_3,'r', 'linewidth', 3);

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 80])
xlim([27.3 27.9])
set(gca,'xtick', [27.4 27.6 27.8])
xlabel('\sigma_{t} [kg m^{-3}]','fontsize',15)
ylabel('Depth [m]', 'fontsize',15)
text(27.35, 6, 'North', 'fontsize', 15)
text(27.84, 6, '(c)', 'fontsize', 15)

%#################################################################
% Plots 76 30 transect
YT_1 = [109 109];
YT_2 = [120 120];
YT_3 = [165 165];
XT = [27 28];

figure
plot(SigmaT121,SigmaT121_depths,'k', 'linewidth', 1.5)
hold on
h1 = plot(XT, YT_1,'r', 'linewidth', 1)
hold on
h2 = plot(XT, YT_2,'--r', 'linewidth', 2)
hold on
h3 = plot(XT, YT_3,'r', 'linewidth', 3)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 200])
xlim([27.1 28])
xlabel('\sigma_{t} [kg m^{-3}]','fontsize',15)
ylabel('Depth [m]', 'fontsize',15)

text(27.35, 14, 'Transect', 'fontsize', 15)
text(27.925, 14, '(d)', 'fontsize', 15)

