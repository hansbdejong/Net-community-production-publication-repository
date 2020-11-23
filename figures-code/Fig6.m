% Plots Figure 6

% Change as appropriate
cd('C:\')

%For the Julian dates, I subtracted 1 so that Jan 1 started at 0.

% Loads data
A = xlsread('MATLAB_SWEENEY_NCP_EXPORT.xlsx');
date_TOC = A(:,1);
date_TOC(isnan(date_TOC)) = [];
TOC = A(:,2);
TOC(isnan(TOC)) = [];
date_NCP = A(:,3);
NCP = A(:,4);
date_export = A(:,5);
date_export(isnan(date_export)) = [];
export = A(:,6);
export(isnan(export)) = [];

%##########################################################################
% Plots NCP
axes('Position',[0.25, 0.57, 0.225, 0.375])
plot([-100 150],[0 0], ':k', 'linewidth',1.5)
hold on
scatter(date_NCP, NCP, 50,'markeredgecolor','k','linewidth', 1.2)
hold on
scatter(date_NCP(65:70), NCP(65:70), 50,'markeredgecolor','r','linewidth', 1.2)

ylim([-2 12])
xlim([-92 151])
ylabel('sNCP [mol m^{-2}]', 'fontsize',12)
set(gca,'FontSize',15)
box on
text(-85,11,'(a)', 'fontsize', 15)
set(gca,'Ytick',0:5:10)

set(gca,'xtick',[-92 -61 -31 0 31 59 90 120],'xticklabel',[], 'fontsize', 15)
y.loc = -2.5;
label_size = 10;

text(-76.5, y.loc, 'Oct', 'fontsize',label_size, 'horizontalalignment', 'center')
text(-46, y.loc, 'Nov', 'fontsize',label_size, 'horizontalalignment', 'center')
text(-15.5, y.loc, 'Dec', 'fontsize',label_size, 'horizontalalignment', 'center')
text(15.5, y.loc, 'Jan', 'fontsize',label_size, 'horizontalalignment', 'center')
text(45, y.loc, 'Feb', 'fontsize',label_size, 'horizontalalignment', 'center')
text(74.5, y.loc, 'Mar', 'fontsize',label_size, 'horizontalalignment', 'center')
text(105, y.loc, 'Apr', 'fontsize',label_size, 'horizontalalignment', 'center')
text(135.5, y.loc, 'May', 'fontsize',label_size, 'horizontalalignment', 'center')

%##########################################################################
% Plots Export

axes('Position',[0.55, 0.57, 0.225, 0.375])
hold on
plot([-100 150],[0 0], ':k', 'linewidth',1.5)
hold on
scatter(date_export, export, 50,'markeredgecolor','k','linewidth', 1.2)
hold on
scatter(date_export(37:42), export(37:42), 50,'markeredgecolor','r','linewidth', 1.2)

ylim([-2 12])
xlim([-92 151])
ylabel('sExport_{200} [mol m^{-2}]', 'fontsize',12)
set(gca,'FontSize',15)
box on
text(-85,11,'(b)', 'fontsize', 15)
set(gca,'Ytick',0:5:10)
hold on
scatter(25, 10.5, 50,'markeredgecolor','k','linewidth', 1.2)
hold on
scatter(25,9,50,'markeredgecolor','r','linewidth', 1.2)
text(35,10.5,'JGOFS', 'fontsize', 15, 'horizontalalignment', 'left',...
    'verticalalignment', 'middle')
text(35,9,'TRACERS', 'fontsize', 15, 'horizontalalignment', 'left',...
    'verticalalignment', 'middle')

set(gca,'xtick',[-92 -61 -31 0 31 59 90 120],'xticklabel',[], 'fontsize', 15)
y.loc = -2.5;
label_size = 10;

text(-76.5, y.loc, 'Oct', 'fontsize',label_size, 'horizontalalignment', 'center')
text(-46, y.loc, 'Nov', 'fontsize',label_size, 'horizontalalignment', 'center')
text(-15.5, y.loc, 'Dec', 'fontsize',label_size, 'horizontalalignment', 'center')
text(15.5, y.loc, 'Jan', 'fontsize',label_size, 'horizontalalignment', 'center')
text(45, y.loc, 'Feb', 'fontsize',label_size, 'horizontalalignment', 'center')
text(74.5, y.loc, 'Mar', 'fontsize',label_size, 'horizontalalignment', 'center')
text(105, y.loc, 'Apr', 'fontsize',label_size, 'horizontalalignment', 'center')
text(135.5, y.loc, 'May', 'fontsize',label_size, 'horizontalalignment', 'center')

%##########################################################################
% Plots pCO2 data

% Change as appropriate
cd('C:\')
axes('Position',[0.4, 0.1, 0.225, 0.375])

% Loads data
A = xlsread('pCO2merged.xlsx');
day = A(:,3);
lat = A(:,5);
lon = A(:,6);
pCO2 = A(:,13);

% Loads data from cruise 13-02
NBP1302 = xlsread('1.13-2.xlsx');
day1302 = NBP1302(:,3);
lat1302 = NBP1302(:,5);
lon1302 = NBP1302(:,6);
pCO2_1302 = NBP1302(:,13);

pCO2_section = pCO2(lat <= -76 & lat >= -77 & lon >= 170 & lon <= 180);
day_section = day(lat <= -76 & lat >= -77 & lon >= 170 & lon <= 180);

%converts Jan-Dec dates to June to July dates: 0 is Jan 1, -1 is Dec 31

for i  =  1:length(pCO2_section)
    if day_section(i) >= 180
        day_section_JJ(i) = day_section(i) - 366;
    else
        day_section_JJ(i) = day_section(i) - 1;
    end
end

r = ksr(day_section_JJ,pCO2_section,5,1000)

% pCO2 data for the 7630 line between 170 and 180

pCO2_section_1302 = pCO2_1302(lat1302 <= -76 & lat1302 >= -77 &...
    lon1302 >= 170 & lon1302 <= 180);
day_section_1302 = day1302(lat1302 <= -76 & lat1302 >= -77 &...
    lon1302 >= 170 & lon1302 <= 180);

%change the dates to June to July
day_section_1302_JJ = day_section_1302 - 1;

%##########################################################################
% Plots pCO2 data

plot(day_section_JJ,pCO2_section,'or','markeredgecolor', [0.6 0.6 0.6],...
    'markerfacecolor',[0.6 0.6 0.6],'markersize',5)
hold on
plot(day_section_1302_JJ, pCO2_section_1302, 'or', 'markerfacecolor',...
    'r', 'markersize', 5)
hold on
plot(r.x(1:750),r.f(1:750), 'k', 'linewidth',1.5)

xlim([-92 151])
ylabel('pCO_{2} [\muatm]', 'fontsize',12)
set(gca,'FontSize',15)
box on
text(-85,450,'(c)', 'fontsize', 15)


set(gca,'xtick',[-92 -61 -31 0 31 59 90 120],'xticklabel',[], 'fontsize', 15)
y.loc = -20
label_size = 10

text(-76.5, y.loc, 'Oct', 'fontsize',label_size, 'horizontalalignment', 'center')
text(-46, y.loc, 'Nov', 'fontsize',label_size, 'horizontalalignment', 'center')
text(-15.5, y.loc, 'Dec', 'fontsize',label_size, 'horizontalalignment', 'center')
text(15.5, y.loc, 'Jan', 'fontsize',label_size, 'horizontalalignment', 'center')
text(45, y.loc, 'Feb', 'fontsize',label_size, 'horizontalalignment', 'center')
text(74.5, y.loc, 'Mar', 'fontsize',label_size, 'horizontalalignment', 'center')
text(105, y.loc, 'Apr', 'fontsize',label_size, 'horizontalalignment', 'center')
text(135.5, y.loc, 'May', 'fontsize',label_size, 'horizontalalignment', 'center')
