close all
clear all
clc

% Standard plot stuff remove/change as needed
set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',20) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');

nlines=4;

allfiles= ["HM0NSAR2"];
dirnames = ["V1"];
tiledlayout('flow')
start_seg = 60;   % cut off the head to remove any kinks
start_time = 120;  % cut off the first cycle to allow the body to shape up
end_time=400;

for k = 1:length(dirnames)   % Cycle through viscosity types

    for j = 1:length(allfiles)  % Cycle through injury types

        kappa_in = readmatrix(sprintf('kappa_%s_%s.csv',dirnames(k),allfiles(j)));
        kappa_mean = readmatrix(sprintf('kappamean_%s_%s.csv',dirnames(k),allfiles(j)));
        u = readmatrix(sprintf('u_%s_%s.csv',dirnames(k),allfiles(j)));
        E = readmatrix(sprintf('E_%s_%s.csv',dirnames(k),allfiles(j)));
        V = readmatrix(sprintf('V_%s_%s.csv',dirnames(k),allfiles(j)));

    end

end

