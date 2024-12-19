% 2024-12-19
% Dopamine MS
clear all
close all

dirroot = 'D:\ST\2024\T\'
cd(dirroot), pwd

pkg load interval
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Data2PS
C8H11NO2MS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%квазар PKS0454+039

figure

h1 = plot(


h3=plot((1+z)*LL(ROI1), Ly_1(ROI1)-0.5, '|k' )
set(h3, 'markersize', 200)
set(h3, 'linewidth', 1)
set(h3, 'color', 0.8*[1 0 0])
xlim([160 330])
axis off

Lz= (1+z)*LL(ROI1)
Lz_str_num =[]
Lz_str = num2str(Lz)
Lz_str_dot = strfind(Lz_str, '.')
for ii=1:length(Lz_str_dot)
  tmp = Lz_str(Lz_str_dot(ii)-3:Lz_str_dot(ii)+1)
  Lz_str_num =  [Lz_str_num; tmp]
 end

 axis on
 up = 0.55
bot = 0.45
ht1 = text (Lz(1)-2, up, "Lalpha", "fontsize", 12);
ht11 = text (Lz(1)-2, bot, Lz_str_num(1,:), "fontsize", 12);
ht2 = text (Lz(2)-2, up, "Lbeta", "fontsize", 12);
ht21 = text (Lz(2)-2, bot,  Lz_str_num(2,:), "fontsize", 12);
##ht3 = text (Lz(3)-2, up, "Lgamma", "fontsize", 12);
##ht31 = text (Lz(3)-2, bot,  Lz_str_num(3,:), "fontsize", 12);
%axis off
box on
xticks([])
yticks([])
figure_name_out=strcat('Lyman Lines z=1.34', '.png')
print('-dpng', '-r300', figure_name_out), pwd
