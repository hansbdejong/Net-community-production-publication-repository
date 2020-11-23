% Plots Figure S13 (Isotopes)

% Change as appropriate
cd('C:\')
A = xlsread('MATLAB_ExportFraction.xlsx');
SurpTOC = A(:,2);
NCP = A(:,3);
MLD = A(:,6);
d13C = A(:,7);

axes('Position',[0.3, 0.3, 0.45, 0.6])
plot([0 14], [0 14], 'k')
hold on
plot([0 14], [0 10.5], 'k')
hold on
plot([0 14], [0 7], 'k')
hold on
plot([0 14], [0 3.5], 'k')
hold on
scatter(NCP,SurpTOC,100,d13C, 'filled', 'markeredgecolor', 'k')
colormap(jet(9))
h = colorbar
caxis([-33 -24])
ylim([0 7])
xlim([0 14])
set(gca, 'Xtick', [0:2:14])
box on
set(gca, 'fontsize', 18)
ylabel('Surp(TOC) [mol m^{-2}]', 'fontsize',15)
xlabel('sNCP [mol m^{-2}]', 'fontsize',15)

text(6.7, 6.6, '0.0', 'fontsize', 15)
text(9, 6.6, '0.25', 'fontsize', 15)
text(12.7, 6.2, '0.5', 'fontsize', 15)
text(12.5, 3, '0.75', 'fontsize', 15)
text(1, 6.6, 'Export Fraction', 'fontsize', 15)

title(h,'\delta^{13}C_{POC} [{^{\fontsize{7}o}}/{\fontsize{7}oo}]', 'fontsize', 15)