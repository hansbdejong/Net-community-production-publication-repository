% Plots Figure 2

%Loads data 

% Change as appropriate
cd('C:\')

HC27 = xlsread('HC027.xlsx');
HC28 = xlsread('HC028.xlsx');
HC29 = xlsread('HC029.xlsx');
HC30 = xlsread('HC030.xlsx');
HC33 = xlsread('HC033.xlsx');
HC34 = xlsread('HC034.xlsx');
HC37 = xlsread('HC037.xlsx');
HC39 = xlsread('HC039.xlsx');
HC40 = xlsread('HC040.xlsx');
HC44 = xlsread('HC044.xlsx');
HC48 = xlsread('HC048.xlsx');
HC99 = xlsread('HC099.xlsx');
HC100 = xlsread('HC100.xlsx');
HC101 = xlsread('HC101.xlsx');
HC102 = xlsread('HC102.xlsx');

% Change as appropriate
cd('C:\ ')

HC17 = xlsread('HC017.xlsx');
HC24 = xlsread('HC024.xlsx');
HC80 = xlsread('HC080.xlsx');
HC81 = xlsread('HC081.xlsx');
HC82 = xlsread('HC082.xlsx');
HC85 = xlsread('HC085.xlsx');
HC86 = xlsread('HC086.xlsx');
HC88 = xlsread('HC088.xlsx');
HC89 = xlsread('HC089.xlsx');
HC92 = xlsread('HC092.xlsx');
HC93 = xlsread('HC093.xlsx');
HC95 = xlsread('HC095.xlsx');
HC107 = xlsread('HC107.xlsx');
HC108 = xlsread('HC108.xlsx');
HC109 = xlsread('HC109.xlsx');
HC110 = xlsread('HC110.xlsx');
HC113 = xlsread('HC113.xlsx');
HC114 = xlsread('HC114.xlsx');
HC115 = xlsread('HC115.xlsx');

% Change as appropriate
cd('C:\')

HC55 = xlsread('HC055.xlsx');
HC56 = xlsread('HC056.xlsx');
HC57 = xlsread('HC057.xlsx');
HC58 = xlsread('HC058.xlsx');
HC63 = xlsread('HC063.xlsx');
HC66 = xlsread('HC066.xlsx');
HC67 = xlsread('HC067.xlsx');
HC68 = xlsread('HC068.xlsx');
HC70 = xlsread('HC070.xlsx');
HC73 = xlsread('HC073.xlsx');
HC74 = xlsread('HC074.xlsx');
HC75 = xlsread('HC075.xlsx');
HC103 = xlsread('HC103.xlsx');
HC104 = xlsread('HC104.xlsx');
HC106 = xlsread('HC106.xlsx');

% Change as appropriate
cd('C:\')

HC119 = xlsread('HC119.xlsx');
HC120 = xlsread('HC120.xlsx');
HC121 = xlsread('HC121.xlsx');
HC122 = xlsread('HC122.xlsx');
HC123 = xlsread('HC123.xlsx');
HC124 = xlsread('HC124.xlsx');

%##########################################################################
% Plot south hotspot
axes('Position',[0.25, 0.52, 0.25, 0.375])

HC80DIC = HC80(:,10);
HC80Depth = HC80(:,6);
HC80Depth(isnan(HC80DIC)) = [];
HC80DIC(isnan(HC80DIC)) = [];
h2_s = plot(HC80DIC,HC80Depth,'r', 'linewidth', 1.5)
hold on

HC81DIC = HC81(:,10);
HC81Depth = HC81(:,6);
HC81Depth(isnan(HC81DIC)) = [];
HC81DIC(isnan(HC81DIC)) = [];
plot(HC81DIC,HC81Depth,'r', 'linewidth', 1.5)
hold on

HC82DIC = HC82(:,10);
HC82Depth = HC82(:,6);
HC82Depth(isnan(HC82DIC)) = [];
HC82DIC(isnan(HC82DIC)) = [];
plot(HC82DIC,HC82Depth,'r', 'linewidth', 1.5)
hold on

HC85DIC = HC85(:,10);
HC85Depth = HC85(:,6);
HC85Depth(isnan(HC85DIC)) = [];
HC85DIC(isnan(HC85DIC)) = [];
plot(HC85DIC,HC85Depth,'r', 'linewidth', 1.5)
hold on

HC86DIC = HC86(:,10);
HC86Depth = HC86(:,6);
HC86Depth(isnan(HC86DIC)) = [];
HC86DIC(isnan(HC86DIC)) = [];
plot(HC86DIC,HC86Depth,'r', 'linewidth', 1.5)
hold on

HC88DIC = HC88(:,10);
HC88Depth = HC88(:,6);
HC88Depth(isnan(HC88DIC)) = [];
HC88DIC(isnan(HC88DIC)) = [];
plot(HC88DIC,HC88Depth,'r', 'linewidth', 1.5)
hold on

HC89DIC = HC89(:,10);
HC89Depth = HC89(:,6);
HC89Depth(isnan(HC89DIC)) = [];
HC89DIC(isnan(HC89DIC)) = [];
plot(HC89DIC,HC89Depth,'r', 'linewidth', 1.5)
hold on

HC92DIC = HC92(:,10);
HC92Depth = HC92(:,6);
HC92Depth(isnan(HC92DIC)) = [];
HC92DIC(isnan(HC92DIC)) = [];
plot(HC92DIC,HC92Depth,'r', 'linewidth', 1.5)
hold on

HC93DIC = HC93(:,10);
HC93Depth = HC93(:,6);
HC93Depth(isnan(HC93DIC)) = [];
HC93DIC(isnan(HC93DIC)) = [];
plot(HC93DIC,HC93Depth,'r', 'linewidth', 1.5)
hold on

HC95DIC = HC95(:,10);
HC95Depth = HC95(:,6);
HC95Depth(isnan(HC95DIC)) = [];
HC95DIC(isnan(HC95DIC)) = [];
plot(HC95DIC,HC95Depth,'r', 'linewidth', 1.5)
hold on

HC107DIC = HC107(:,10);
HC107Depth = HC107(:,6);
HC107Depth(isnan(HC107DIC)) = [];
HC107DIC(isnan(HC107DIC)) = [];
h3_s = plot(HC107DIC,HC107Depth,'k', 'linewidth', 1.5)
hold on

HC108DIC = HC108(:,10);
HC108Depth = HC108(:,6);
HC108Depth(isnan(HC108DIC)) = [];
HC108DIC(isnan(HC108DIC)) = [];
plot(HC108DIC,HC108Depth,'k', 'linewidth', 1.5)
hold on

HC109DIC = HC109(:,10);
HC109Depth = HC109(:,6);
HC109Depth(isnan(HC109DIC)) = [];
HC109DIC(isnan(HC109DIC)) = [];
plot(HC109DIC,HC109Depth,'k', 'linewidth', 1.5)
hold on

HC110DIC = HC110(:,10);
HC110Depth = HC110(:,6);
HC110Depth(isnan(HC110DIC)) = [];
HC110DIC(isnan(HC110DIC)) = [];
plot(HC110DIC,HC110Depth,'k', 'linewidth', 1.5)
hold on

HC113DIC = HC113(:,10);
HC113Depth = HC113(:,6);
HC113Depth(isnan(HC113DIC)) = [];
HC113DIC(isnan(HC113DIC)) = [];
plot(HC113DIC,HC113Depth,'k', 'linewidth', 1.5)
hold on

HC114DIC = HC114(:,10);
HC114Depth = HC114(:,6);
HC114Depth(isnan(HC114DIC)) = [];
HC114DIC(isnan(HC114DIC)) = [];
plot(HC114DIC,HC114Depth,'k', 'linewidth', 1.5)
hold on

HC115DIC = HC115(:,10);
HC115Depth = HC115(:,6);
HC115Depth(isnan(HC115DIC)) = [];
HC115DIC(isnan(HC115DIC)) = [];
plot(HC115DIC,HC115Depth,'k', 'linewidth', 1.5)
hold on

HC17DIC = HC17(:,10);
HC17Depth = HC17(:,6);
HC17Depth(isnan(HC17DIC)) = [];
HC17DIC(isnan(HC17DIC)) = [];
h1_s = plot(HC17DIC,HC17Depth,'b', 'linewidth', 1.5)
hold on

HC24DIC = HC24(:,10);
HC24Depth = HC24(:,6);
HC24Depth(isnan(HC24DIC)) = [];
HC24DIC(isnan(HC24DIC)) = [];
plot(HC24DIC,HC24Depth,'b', 'linewidth', 1.5)
hold on

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 400])
ylabel('Depth [m]', 'fontsize',15)
xlabel('nDIC [\mumol kg^{-1}]','fontsize',15)
box on
legend([h1_s h2_s h3_s],'17-18 Feb', '2-5 Mar', '7-9 Mar', 'location', 'southwest')
text(2235,30,'(a)', 'fontsize', 15)
text(2125, 150, 'South', 'fontsize', 15)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes('Position',[0.55, 0.52, 0.25, 0.375])
%plots Terra Nova Bay

HC27DIC = HC27(:,10);
HC27Depth = HC27(:,6);
HC27Depth(isnan(HC27DIC)) = [];
HC27DIC(isnan(HC27DIC)) = [];
h1_tnb = plot(HC27DIC,HC27Depth,'b', 'linewidth', 1.5)
hold on

HC28DIC = HC28(:,10);
HC28Depth = HC28(:,6);
HC28Depth(isnan(HC28DIC)) = [];
HC28DIC(isnan(HC28DIC)) = [];
plot(HC28DIC,HC28Depth,'b', 'linewidth', 1.5)
hold on

HC29DIC = HC29(:,10);
HC29Depth = HC29(:,6);
HC29Depth(isnan(HC29DIC)) = [];
HC29DIC(isnan(HC29DIC)) = [];
plot(HC29DIC,HC29Depth,'b', 'linewidth', 1.5)
hold on

HC30DIC = HC30(:,10);
HC30Depth = HC30(:,6);
HC30Depth(isnan(HC30DIC)) = [];
HC30DIC(isnan(HC30DIC)) = [];
plot(HC30DIC,HC30Depth,'b', 'linewidth', 1.5)
hold on

HC33DIC = HC33(:,10);
HC33Depth = HC33(:,6);
HC33Depth(isnan(HC33DIC)) = [];
HC33DIC(isnan(HC33DIC)) = [];
plot(HC33DIC,HC33Depth,'b', 'linewidth', 1.5)
hold on

HC34DIC = HC34(:,10);
HC34Depth = HC34(:,6);
HC34Depth(isnan(HC34DIC)) = [];
HC34DIC(isnan(HC34DIC)) = [];
plot(HC34DIC,HC34Depth,'b', 'linewidth', 1.5)
hold on

HC37DIC = HC37(:,10);
HC37Depth = HC37(:,6);
HC37Depth(isnan(HC37DIC)) = [];
HC37DIC(isnan(HC37DIC)) = [];
plot(HC37DIC,HC37Depth,'b', 'linewidth', 1.5)
hold on

HC39DIC = HC39(:,10);
HC39Depth = HC39(:,6);
HC39Depth(isnan(HC39DIC)) = [];
HC39DIC(isnan(HC39DIC)) = [];
plot(HC39DIC,HC39Depth,'b', 'linewidth', 1.5)
hold on

HC40DIC = HC40(:,10);
HC40Depth = HC40(:,6);
HC40Depth(isnan(HC40DIC)) = [];
HC40DIC(isnan(HC40DIC)) = [];
plot(HC40DIC,HC40Depth,'b', 'linewidth', 1.5)
hold on

HC44DIC = HC44(:,10);
HC44Depth = HC44(:,6);
HC44Depth(isnan(HC44DIC)) = [];
HC44DIC(isnan(HC44DIC)) = [];
plot(HC44DIC,HC44Depth,'b', 'linewidth', 1.5)
hold on

HC48DIC = HC48(:,10);
HC48Depth = HC48(:,6);
HC48Depth(isnan(HC48DIC)) = [];
HC48DIC(isnan(HC48DIC)) = [];
plot(HC48DIC,HC48Depth,'b', 'linewidth', 1.5)
hold on

HC99DIC = HC99(:,10);
HC99Depth = HC99(:,6);
HC99Depth(isnan(HC99DIC)) = [];
HC99DIC(isnan(HC99DIC)) = [];
h2_tnb = plot(HC99DIC,HC99Depth,'r', 'linewidth', 1.5)
hold on

HC100DIC = HC100(:,10);
HC100Depth = HC100(:,6);
HC100Depth(isnan(HC100DIC)) = [];
HC100DIC(isnan(HC100DIC)) = [];
plot(HC100DIC,HC100Depth,'r', 'linewidth', 1.5)
hold on

HC101DIC = HC101(:,10);
HC101Depth = HC101(:,6);
HC101Depth(isnan(HC101DIC)) = [];
HC101DIC(isnan(HC101DIC)) = [];
plot(HC101DIC,HC101Depth,'r', 'linewidth', 1.5)
hold on

HC102DIC = HC102(:,10);
HC102Depth = HC102(:,6);
HC102Depth(isnan(HC102DIC)) = [];
HC102DIC(isnan(HC102DIC)) = [];
plot(HC102DIC,HC102Depth,'r', 'linewidth', 1.5)
hold on

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 400])

xlabel('nDIC [\mumol kg^{-1}]','fontsize',15)
ylabel('depth [m]', 'fontsize', 15)
box on
set(gca,'YTickLabel','')
legend([h1_tnb, h2_tnb],'19-24 Feb', '5-6 Mar', 'location', 'southwest')
text(2235,30,'(b)', 'fontsize', 15)
text(2125, 150, 'TNB', 'fontsize', 15)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%lots North hotspot
axes('Position',[0.25, 0.05, 0.25, 0.375])
HC55DIC = HC55(:,10);
HC55Depth = HC55(:,6);
HC55Depth(isnan(HC55DIC)) = [];
HC55DIC(isnan(HC55DIC)) = [];
h1_n = plot(HC55DIC,HC55Depth,'b', 'linewidth', 1.5)
hold on

HC56DIC = HC56(:,10);
HC56Depth = HC56(:,6);
HC56Depth(isnan(HC56DIC)) = [];
HC56DIC(isnan(HC56DIC)) = [];
plot(HC56DIC,HC56Depth,'b', 'linewidth', 1.5)
hold on

HC57DIC = HC57(:,10);
HC57Depth = HC57(:,6);
HC57Depth(isnan(HC57DIC)) = [];
HC57DIC(isnan(HC57DIC)) = [];
plot(HC57DIC,HC57Depth,'b', 'linewidth', 1.5)
hold on

HC58DIC = HC58(:,10);
HC58Depth = HC58(:,6);
HC58Depth(isnan(HC58DIC)) = [];
HC58DIC(isnan(HC58DIC)) = [];
plot(HC58DIC,HC58Depth,'b', 'linewidth', 1.5)
hold on

HC63DIC = HC63(:,10);
HC63Depth = HC63(:,6);
HC63Depth(isnan(HC63DIC)) = [];
HC63DIC(isnan(HC63DIC)) = [];
plot(HC63DIC,HC63Depth,'b', 'linewidth', 1.5)
hold on

HC66DIC = HC66(:,10);
HC66Depth = HC66(:,6);
HC66Depth(isnan(HC66DIC)) = [];
HC66DIC(isnan(HC66DIC)) = [];
plot(HC66DIC,HC66Depth,'b', 'linewidth', 1.5)
hold on

HC67DIC = HC67(:,10);
HC67Depth = HC67(:,6);
HC67Depth(isnan(HC67DIC)) = [];
HC67DIC(isnan(HC67DIC)) = [];
plot(HC67DIC,HC67Depth,'b', 'linewidth', 1.5)
hold on

HC68DIC = HC68(:,10);
HC68Depth = HC68(:,6);
HC68Depth(isnan(HC68DIC)) = [];
HC68DIC(isnan(HC68DIC)) = [];
plot(HC68DIC,HC68Depth,'b', 'linewidth', 1.5)
hold on

HC70DIC = HC70(:,10);
HC70Depth = HC70(:,6);
HC70Depth(isnan(HC70DIC)) = [];
HC70DIC(isnan(HC70DIC)) = [];
plot(HC70DIC,HC70Depth,'b', 'linewidth', 1.5)
hold on

HC73DIC = HC73(:,10);
HC73Depth = HC73(:,6);
HC73Depth(isnan(HC73DIC)) = [];
HC73DIC(isnan(HC73DIC)) = [];
plot(HC73DIC,HC73Depth,'b', 'linewidth', 1.5)
hold on

HC74DIC = HC74(:,10);
HC74Depth = HC74(:,6);
HC74Depth(isnan(HC74DIC)) = [];
HC74DIC(isnan(HC74DIC)) = [];
plot(HC74DIC,HC74Depth,'b', 'linewidth', 1.5)
hold on

HC75DIC = HC75(:,10);
HC75Depth = HC75(:,6);
HC75Depth(isnan(HC75DIC)) = [];
HC75DIC(isnan(HC75DIC)) = [];
plot(HC75DIC,HC75Depth,'b', 'linewidth', 1.5)
hold on

HC103DIC = HC103(:,10);
HC103Depth = HC103(:,6);
HC103Depth(isnan(HC103DIC)) = [];
HC103DIC(isnan(HC103DIC)) = [];
h2_n = plot(HC103DIC,HC103Depth,'r', 'linewidth', 1.5)
hold on

HC104DIC = HC104(:,10);
HC104Depth = HC104(:,6);
HC104Depth(isnan(HC104DIC)) = [];
HC104DIC(isnan(HC104DIC)) = [];
plot(HC104DIC,HC104Depth,'r', 'linewidth', 1.5)
hold on

HC106DIC = HC106(:,10);
HC106Depth = HC106(:,6);
HC106Depth(isnan(HC106DIC)) = [];
HC106DIC(isnan(HC106DIC)) = [];
plot(HC106DIC,HC106Depth,'r', 'linewidth', 1.5)
hold on

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 400])
set(gca,'XTickLabel','')
ylabel('Depth [m]', 'fontsize',15)
box on
leg = legend([h1_n, h2_n],'24 Feb - 1 Mar', '6-7 Mar', 'location', 'southwest')
text(2235,30,'(c)', 'fontsize', 15)
text(2125, 150, 'North', 'fontsize', 15)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots 76 30 line

axes('Position',[0.55, 0.05, 0.25, 0.375])

HC119DIC = HC119(:,10);
HC119Depth = HC119(:,6);
HC119Depth(isnan(HC119DIC)) = [];
HC119DIC(isnan(HC119DIC)) = [];
plot(HC119DIC,HC119Depth,'b', 'linewidth', 1.5)
hold on

HC120DIC = HC120(:,10);
HC120Depth = HC120(:,6);
HC120Depth(isnan(HC120DIC)) = [];
HC120DIC(isnan(HC120DIC)) = [];
plot(HC120DIC,HC120Depth,'b', 'linewidth', 1.5)
hold on

HC121DIC = HC121(:,10);
HC121Depth = HC121(:,6);
HC121Depth(isnan(HC121DIC)) = [];
HC121DIC(isnan(HC121DIC)) = [];
plot(HC121DIC,HC121Depth,'b', 'linewidth', 1.5)
hold on

HC122DIC = HC122(:,10);
HC122Depth = HC122(:,6);
HC122Depth(isnan(HC122DIC)) = [];
HC122DIC(isnan(HC122DIC)) = [];
plot(HC122DIC,HC122Depth,'b', 'linewidth', 1.5)
hold on


HC123DIC = HC123(:,10);
HC123Depth = HC123(:,6);
HC123Depth(isnan(HC123DIC)) = [];
HC123DIC(isnan(HC123DIC)) = [];
plot(HC123DIC,HC123Depth,'b', 'linewidth', 1.5)
hold on


HC124DIC = HC124(:,10);
HC124Depth = HC124(:,6);
HC124Depth(isnan(HC124DIC)) = [];
HC124DIC(isnan(HC124DIC)) = [];
plot(HC124DIC,HC124Depth,'b', 'linewidth', 1.5)
hold on

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
ylim([0 400])
xlim([2100 2250])
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
box on
legend('9-11 Mar', 'location', 'southwest')
text(2235,30,'(d)', 'fontsize', 15)
text(2125, 150, 'Transect', 'fontsize', 15)

