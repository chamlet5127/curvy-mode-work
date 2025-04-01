% Plot the vertical displacements
close all
clear all
clc

set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',20) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');

tiledlayout('flow')

% all of the files (the point 1's need to be done separately because only a
% few ran

% allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4"]; %% ,"HM4NSAR2"%% ,
dirnames = ["V1","V2","V10"];

for i = 1:length(dirnames);
    for j = 1:length(allfiles);
        % read in the modes
        u = readmatrix(sprintf('./Excursions/vert_tail_%s_%s.csv',dirnames(i),allfiles(j)));
        nexttile
        plot(u)
        hold on
        title(sprintf('tail, %s-%s',dirnames(i),allfiles(j)))
        % colorbar
        grid on
        axis([0 600 -2 3])
    end
end