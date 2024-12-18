% 2024-12-18
% Lyman forest
clear all
close all

dirroot = 'D:\ST\2024\T\'
cd(dirroot), pwd

pkg load interval
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ly = [
121.6 ;102.5;97.2;94.9; 93.7; 93.0; 92.6; 92.3; 92.1; 91.9; 91.15
]

Ly_n = [
2 ; 3; 4; 5;6; 7; 8; 9 ; 10; 11; 12
]
% 12 = Inf

m=size(Ly,1 )
Ly_1 = ones(m,1)

figure
hold on
h1 = plot(Ly, Ly_1, '|k' )
set(h1, 'markersize', 100)
set(h1, 'linewidth', 1)
ylim([1-0.02 1+0.02])
h2=plot(2*Ly, Ly_1, '|k' )
set(h2, 'markersize', 100)
set(h2, 'linewidth', 1)
set(h2, 'color', 0.5*[1 0 0])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

R_H = 1.09968*10^(7) % m-1 *10^9 % nm
for k=1:11
LL(k) = (R_H*(1-1/(k+1)^2))^(-1)*10^9;
end

ROI=[1:3] %, 11]
figure
hold on
xx = [LL(ROI(1)) LL(ROI(1))]
yy = [0 1]
h1 = plot(xx, yy, '-k' )
xx = [LL(ROI(2)) LL(ROI(2))]
yy = [0 1]
h2 = plot(xx, yy, '-k' )
xx = [LL(ROI(3)) LL(ROI(3))]
yy = [0 1]
h3 = plot(xx, yy, '-k' )
xx = [LL(11) LL(11)]
yy = [0 1]
h11 = plot(xx, yy, '-k' )


up = 1.05
bot = -0.05
ht1 = text (LL(1)-2, up, "Lalpha", "fontsize", 14);
ht11 = text (LL(1)-2, bot, "121.6", "fontsize", 14);
ht2 = text (LL(2)-2, up, "Lbeta", "fontsize", 14);
ht21 = text (LL(2)-2, bot, "102.5", "fontsize", 14);
ht3 = text (LL(3)-2, up, "Lgamma", "fontsize", 14);
ht31 = text (LL(3)-2, bot, "97.2", "fontsize", 14);
ht4 = text (LL(11)-2, up, "Llim", "fontsize", 14);
ht41 = text (LL(11)-2, bot, "91.5", "fontsize", 14);
box off
axis off


ROI1 =1:3
for z=0.005:0.0025:0.02
h2=plot((1+z)*LL(ROI1), Ly_1(ROI1)-0.5, '|k' )
set(h2, 'markersize', 180)
set(h2, 'linewidth', 1)
set(h2, 'color', 0.5*[1 0 0])
end

 ylim([-0.1 1.1])
xlim([90 130])
yticks([])


xlabel("Wavelength, nm")
figure_name_out=strcat('Lyman Forest', '.png')
print('-dpng', '-r300', figure_name_out), pwd

