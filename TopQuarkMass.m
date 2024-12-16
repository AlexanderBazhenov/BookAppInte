% 2024-12-16
% Top Quark mass
clear all
close all

dirroot = 'D:\ST\2024\T\'
cd(dirroot), pwd

pkg load interval

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Загрузить данные
load topquark.mat

data = topquark.data;
data_vars = topquark.vars

topquark_mid = data(:,1);
topquark_rad_std = data(:,2);
topquark_rad_std_syst = data(:,2) + data(:,4);

# Интервальные измерения только со случайной погрешностью
TQstd = midrad(topquark_mid, topquark_rad_std)

# Интервальные измерения со случайной и систематической погрешностью
TQtotal = midrad(topquark_mid, topquark_rad_std_syst)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Графическое представление интервальных данных
nums = 1:numel(TQtotal);
vals = mid(TQtotal);
errorbar (vals, nums, rad(TQtotal), rad(TQtotal),">.r");
ylim([0 nums(end)+1])
hold on
h = errorbar (vals, nums, rad(TQstd), rad(TQstd),">.b");
set(h,"linewidth",2)
set(h,"markersize",12)
title ("Interval measurements of t-quark mass");
xlabel("t-quark mass, GeV")
ylabel("Measurement number")
legend ("Measurements with total errors","Measurements with std errors","location","southeast");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Функция построения оценки константы по интервальным измерениям
# методом центра неопределённости (МЦН) [13]
function [oskorbin_center, k] = estimate_uncertainty_center(intervals)
  n = numel(intervals);
  y = mid(intervals);
  e = rad(intervals);
  A = [ones(n,1), -e; -ones(n,1), -e];
  b = [y; -y];
  c = [0 1];
  lb = [-Inf 0];
  ub = [Inf Inf];
  ctype(1:2*n) = 'U';
  vartype(1:2) = 'C';
  sense = 1;
  [beta, fval, exitcode] = glpk (c, A, b, lb, ub, ctype, vartype, sense);
  if exitcode < 0
      return
  end
  oskorbin_center = beta(1);
  k = beta(2);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[oskorbin_center, k] = estimate_uncertainty_center(TQtotal)

# Графическое представление интервальных данных и МЦН-оценки значения массы t-кварка
errorbar (vals, nums, k*rad(TQtotal), k*rad(TQtotal),">.k");
ylim([0 nums(end)+1])
hold on
h = errorbar (vals, nums, rad(TQtotal), rad(TQtotal),">.r");
set(h,"linewidth",1.5)
h = errorbar (vals, nums, rad(TQstd), rad(TQstd),">.b");
set(h,"linewidth",2)
set(h,"markersize",12)
title ("Interval measurements of t-quark mass");
xlabel("t-quark mass, GeV")
ylabel("Measurement number")
plot(oskorbin_center*[1 1], ylim, 'm--')
legend ("k-scaled measurements", "Measurements with total errors",...
        "Measurements with standard errors", "Oskorbin center",...
        "location","southeast");
set(legend,    "fontsize", 12)
 set(gca, "fontsize", 13)
figure_name_out=strcat('Top Quark mass', '.png')
print('-dpng', '-r300', figure_name_out), pwd


min_incl = max(inf(TQtotal))
max_incl = min(sup(TQtotal))
