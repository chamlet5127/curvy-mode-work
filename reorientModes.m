close all
clear all
clc

% This tries to plot all of the modes in the same orientation, 
% i.e. makes them all have the same sign convention 

set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',10) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');

allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
dirnames = ["VP5","V1","V2","V10"];
% This is for the 0.1x viscosity since not all of them ran.
% % allfiles= ["HM0NSAR2","HM4NSAR2"];
% % dirnames = ["VP1"];
tiledlayout('flow')
% Pick a region to line up the signs of the modes
sign_check = [275 120]
for k = 1:2
    %% First Mode
    for j = 1:length(allfiles)   % j tracks filename, injury type
        % preallocate the size of the mode matrix so matlab stops
        % complaining
        oModes=zeros(321,length(dirnames));
        for i = 1:length(dirnames)   % i tracks directory, viscosity type
            % read in the mode file for the particular run
            u = readmatrix(sprintf('u_%s_%s.csv',dirnames(i),allfiles(j)));
            % Align all of the modes so that they have the same sign
            oModes(:,i)=(u(:,k));
            if oModes(sign_check(k),i)<0
                oModes(:,i)=-oModes(:,i);
            end    
        end
        nexttile
        plot(oModes)
        axis([0 330 -0.2 0.2])
        legend("VP5","V1","V2","V10","Location","southeast")
        title(sprintf('mode %d, %s',k, allfiles(j)))
        % % export_fig(sprintf('./Overlays/overlay_%d_%s',k,allfiles(j)),'-png','-nocrop')
        % % clf
    end
end
