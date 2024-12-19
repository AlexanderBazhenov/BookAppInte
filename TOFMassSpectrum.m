% 2024-12-19
% TOF-MS
clear all
close all

dirroot = 'D:\ST\2024\T\'
cd(dirroot), pwd

pkg load interval
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a=0
b=1
m=1:20
for ii=1:length(m)
TOF(ii)=a+b*sqrt(m(ii))
end
MM = ones(length(m), 1);

figure
hold on
for ii=1:length(m)
  xx = [TOF(ii) TOF(ii)]
  yy = [0 1]
h =plot(xx, yy, '-k')
set(h, 'color', 0.5*[1 0 0])
text(TOF(ii), 1.05, num2str(ii))
end

xx=[0.5 TOF(length(m))+0.5]
yy = [0 0]
h2 =plot(xx, yy, '-k')

set(gca, 'fontsize', 14)
yticks([])
xlim([0.5, 4.5])

xlabel("время пролета")
figure_name_out=strcat('Lyman Forest', '.png')
print('-dpng', '-r300', figure_name_out), pwd
