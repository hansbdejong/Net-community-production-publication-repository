% Plots Figure 11, d13C data

% Change as appropriate
cd('C:\')

% Loads data
fid = xlsread('Isotopes_scatter.xlsx');

TNB_dep = fid(:,5);
dep_7630 = fid(:,11);

TNB_C = fid(:,6);
C_7630 = fid(:,12);


%##########################################################################
% Plots data

scatter(C_7630,dep_7630,50,'MarkerEdgeColor','k','linewidth', 1)
hold on
scatter(TNB_C,TNB_dep,50,'MarkerEdgeColor','r', 'linewidth', 1)
set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',15)
xlim([-34 -22])
ylim([-35 1200])
xlabel('\delta^{13}C_{POC} [{^{\fontsize{7}o}}/{\fontsize{7}oo}]',...
    'fontsize',15)
ylabel('depth [m]', 'fontsize', 15)
set(gca,'Ytick',0:200:1200)
set(gca,'YTickLabel',{'0', '', '400', '','800','','1200'})
box on
legend(['76' 176 '30'' S'],'TNB','location', 'southwest')



