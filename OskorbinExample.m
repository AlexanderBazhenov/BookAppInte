% 2024-12-17
% Oskorbin example
clear all
close all


cd(dirroot), pwd

pkg load interval

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Загрузить данные
X = [
infsup(1,3)
infsup(6,10)
]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

min_incl = max(inf(X))
max_incl = min(sup(X))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[oskorbin_center, k] = estimate_uncertainty_center(X)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Графическое представление интервальных данных
figure
nums = 1:numel(X);
vals = mid(X);
h1 = errorbar (vals, nums, rad(X), rad(X),">.r");
ylim([0.5 nums(end)+0.5])
xlim([-1 13])
hold on
h2 = errorbar (vals, nums, k*rad(X), k*rad(X),">.b");
yticks([1 2])
set(h1,"linewidth",3)
set(h1,"markersize",16)
h3 = plot(oskorbin_center*[1 1], ylim, 'm--')
set(h2,"linewidth",1.5)
legend ( "Measurements with errors", "k-scaled measurements", ...
        "Oskorbin center",...
        "location","east");
set(legend,    "fontsize", 14)
 set(gca, "fontsize", 14)

xlabel("Data")
ylabel("Measurement number")

figure_name_out=strcat('Oskorbin method example', '.png')
print('-dpng', '-r300', figure_name_out), pwd


