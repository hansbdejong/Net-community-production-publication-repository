% Plots Figure 8 (POC profiles)

% Change as appropriate
cd('C:\')

% Loads data
fid = xlsread('All_cruises_7630_POC.xlsx');
earlyspringdep = fid(:,1);
earlyspring = fid(:,2);
latespringdep = fid(:,3);
latespring = fid(:,4);
summerdep = fid(:,5);
summer = fid(:,6);
earlyautumndep = fid(:,9);
earlyautumn = fid(:,10);
autumndep = fid(:,7);
autumn = fid(:,8);


%##########################################################################
% Plots subplot(2,2,1)

axes('Position',[0.25, 0.52, 0.25, 0.375])
plot(earlyspring,earlyspringdep,'ko', 'linewidth', 1.5)
set(gca,'YDir','Reverse','XAxisLocation','top')
xlim([0 120])
ylim([0 400])
set(gca,'Xtick',0:40:120)
set(gca,'Ytick',0:100:400)
set(gca,'FontSize',15)

text(20,250,'Spring','fontsize',15)
text(20,300,'17 Oct - 6 Nov 1996','fontsize',15)
text(107,30,'(a)', 'fontsize', 15)
xlabel('POC [\mumol L^{-1}]','fontsize',15)
ylabel('depth [m]','fontsize',15)


%##########################################################################
% Plots subplot(2,2,2)
axes('Position',[0.55, 0.52, 0.25, 0.375])
plot(summer,summerdep,'ko', 'linewidth', 1.5)
set(gca,'YDir','Reverse','XAxisLocation','top')
ylim([0 400])
xlim([0 120])
set(gca,'Xtick',0:40:120)
set(gca,'Ytick',0:100:400)
set(gca,'FontSize',15)

text(20,250,'Summer','fontsize',15)
text(20,300,'13 Jan - 8 Feb 1997','fontsize',15)
text(110,30,'(b)', 'fontsize', 15)
xlabel('POC [\mumol L^{-1}]','fontsize',15)

set(gca,'YTickLabel','')

%##########################################################################
% Plots subplot(2,2,3)
axes('Position',[0.25, 0.05, 0.25, 0.375])
plot(earlyautumn,earlyautumndep,'ro', 'linewidth', 1.5)
set(gca,'YDir','Reverse','XAxisLocation','top')
xlim([0 120])
ylim([0 400])
set(gca,'Xtick',0:40:120)
set(gca,'Ytick',0:100:400)
set(gca,'FontSize',15)

text(20,250,'Late Summer','fontsize',15)
text(20,300,'9 Mar - 11 Mar 2013','fontsize',15)
text(107,30,'(c)', 'fontsize', 15)
ylabel('depth [m]','fontsize',15)
set(gca,'XTickLabel','')

%##########################################################################
%subplot(2,2,4)
axes('Position',[0.55, 0.05, 0.25, 0.375])
plot(autumn,autumndep,'ko', 'linewidth', 1.5)
set(gca,'YDir','Reverse','XAxisLocation','top')
xlim([0 120])
ylim([0 400])
set(gca,'Xtick',0:40:120)
set(gca,'Ytick',0:100:400)
set(gca,'FontSize',15)

text(20,250,'Autumn','fontsize',15)
text(20,300,'14 Apr - 26 Apr 1997','fontsize',15)
text(107,30,'(d)', 'fontsize', 15)
set(gca,...
'XTickLabel','','YTickLabel','')
