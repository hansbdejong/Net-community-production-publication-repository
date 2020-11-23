% Plots Figure 7 (nDIC profiles)

% Change as appropriate
cd('C:\')

% Loads data
fid = xlsread('All_cruises_7630_sDIC.xlsx');
springdep = fid(:,1);
spring = fid(:,4);
latespringdep = fid(:,5);
latespring = fid(:,8);
summerdep = fid(:,9);
summer = fid(:,12);
earlyautumndep = fid(:,17);
earlyautumn = fid(:,20);
autumndep = fid(:,13);
autumn = fid(:,16);

%##########################################################################
% Plots sprint - subplot(2,2,1)

axes('Position',[0.25, 0.52, 0.25, 0.375])
plot(spring,springdep,'ko', 'linewidth', 1.5)
set(gca,'YDir','Reverse','XAxisLocation','top')
xlim([2050 2250])
ylim([0 400])
set(gca,'Xtick',2050:50:2250)
set(gca,'Ytick',0:100:400)
set(gca,'FontSize',15)

text(2080,250,'Spring','fontsize',15)
text(2080,300,'17 Oct - 6 Nov 1996','fontsize',15)
text(2060,30,'(a)', 'fontsize', 15)
xlabel('nDIC [\mumol kg^{-1}]','fontsize',15)
ylabel('depth [m]','fontsize',15)


%##########################################################################
% Plots summer, subplot(2,2,2)
axes('Position',[0.55, 0.52, 0.25, 0.375])
plot(summer,summerdep,'ko', 'linewidth', 1.5)
set(gca,'YDir','Reverse','XAxisLocation','top')
xlim([2050 2250])
ylim([0 400])
set(gca,'Xtick',2050:50:2250)
set(gca,'Ytick',0:100:400)
set(gca,'FontSize',15)
set(gca,'YTickLabel','')

text(2080,250,'Summer','fontsize',15)
text(2080,300,'13 Jan - 8 Feb 1997','fontsize',15)
text(2060,60,'(b)', 'fontsize', 15)
xlabel('nDIC [\mumol kg^{-1}]','fontsize',15)

%##########################################################################
% Plots Late summer, subplot(2,2,3)
axes('Position',[0.25, 0.05, 0.25, 0.375])
plot(earlyautumn,earlyautumndep,'ro', 'linewidth', 1.5)
set(gca,'YDir','Reverse','XAxisLocation','top')
xlim([2050 2250])
ylim([0 400])
set(gca,'Xtick',2050:50:2250)
set(gca,'Ytick',0:100:400)
set(gca,'FontSize',15)
set(gca,'XTickLabel','')

text(2080,250,'Late Summer','fontsize',15)
text(2080,300,'9 Mar - 11 Mar 2013','fontsize',15)
text(2060,30,'(c)', 'fontsize', 15)
ylabel('depth [m]','fontsize',15)

%##########################################################################
% Plots autumn, subplot(2,2,4)
axes('Position',[0.55, 0.05, 0.25, 0.375])
plot(autumn,autumndep,'ko', 'linewidth', 1.5)
set(gca,'YDir','Reverse','XAxisLocation','top')
xlim([2050 2250])
ylim([0 400])
set(gca,'Xtick',2050:50:2250)
set(gca,'Ytick',0:100:400)
set(gca,'FontSize',15)
set(gca,...
'XTickLabel','','YTickLabel','')

text(2080,250,'Autumn','fontsize',15)
text(2080,300,'14 Apr - 26 Apr 1997','fontsize',15)
text(2060,30,'(d)', 'fontsize', 15)
