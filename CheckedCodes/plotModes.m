close all
clear all
clc

%This plots the modes, they're constructed and saved in another file
%This file reads in the saved csv files

set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',10) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');

% set up plotting
tiledlayout('flow')

% all of the files (the point 1's need to be done separately because only a
% few ran

allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
dirnames = ["VP5","V1","V2","V10"];

for i = 1:length(dirnames);
    for j = 1:length(allfiles);
        % read in the modes
        u = readmatrix(sprintf('u_%s_%s.csv',dirnames(i),allfiles(j)));
        nexttile
        plot(u(:,1))
        hold on
        plot(u(:,2),":")
        title(sprintf('modes, %s-%s',dirnames(i),allfiles(j)))
        % colorbar
        grid off
        axis([0 350 -0.15 0.15])
    end
end
% % close all
% % % % keyboard
% % allfiles= ["HM0NSAR2","HM4NSAR2"];
% % dirnames = ["VP1"];
% % for i = 1:length(dirnames);
% %     for j = 1:length(allfiles);
% %         figure(i*j*100)
% %         clf
% %          my_file=allfiles(j);
% %         u = readmatrix(sprintf('u_%s_%s.csv',dirnames(i),my_file));
% %         plot(u(:,1))
% %         hold on
% %         plot(u(:,2),":")
% %         title(sprintf('modes, %s-%s',dirnames(i),my_file))
% %         % colorbar
% %         grid off
% %         % % [u1,E1,V1,kappa,meanKappa] = PCA_curvemean_fn(fullfile('./',dirnames(i),my_file));
% %         % % writematrix(meanKappa,sprintf('kappamean_%s_%s.csv',dirnames(i),my_file));
% %         % % writematrix(kappa,sprintf('kappa_%s_%s.csv',dirnames(i),my_file));
% %         % % writematrix(u1,sprintf('u_%s_%s.csv',dirnames(i),my_file));
% %         export_fig(sprintf('./Modes/modes_%s-%s',dirnames(i),my_file),'-png','-nocrop')
% %         hold off
% %     end
% % end