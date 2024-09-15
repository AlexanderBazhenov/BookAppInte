% 2024-09-15
% balloon geometry

clear all
close all
% dirroot = 'D:\Data\ST\2021\T\'
% 2024-03-04
dirroot = 'D:\ST\2024\T\'
dirOld23 =  'd:\ST\2023\T\'
%
##dirroot ='e:\Users\Public\Documents\ST\2024\T\'
##dirOld23 =  'e:\Users\Public\Documents\ST\2023\T\'
%
addpath(dirroot)
addpath(dirOld23)
cd(dirroot)
%
m = 50/1000 % 1 g
rho = 1000 %
V = m / rho % m^3
% V = S d = 4 pi R^2 d
% d = V/S = V / (4piR^2)
% m = rho V
%
R = 0.05:0.025:0.15 % 10 sm
R = R %* 2
S = 4*3.14*R.^2 % m^2
dinv = S./V;
d = dinv.^(-1) % m
dum= d * 10^6  % um
Rsm = R * 100 % sm

for kk=1:length(R)-1
  dd = (R(kk+1)-d(kk+1)-R(kk)+d(kk)) / (R(kk+1)-R(kk))
end
