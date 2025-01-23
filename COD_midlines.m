close all
clear all
clc
% This code brings in the files with curvature information and writes the
% PCA matrices. If C is the curvature matrix this writes u,E,V where
% C = uEV^T
set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',20) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');
npt=321;
nlines=4;
allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
dirnames = ["VP5","V1","V2","V10"];
% % allfiles= ["HM0NSAR2"]; %% ,"HM4NSAR2"%% ,
% % dirnames = ["V1"];

figure(1)
tiledlayout(length(dirnames),length(allfiles))

for i = 1:length(dirnames);
    for j = 1:length(allfiles);
        my_file=allfiles(j);

        file_name=fullfile('./',dirnames(i),my_file);
            z = readmatrix(sprintf('exc_%s_%s.csv',dirnames(i),my_file));
    
        figure(1)
            nexttile
            plot(1:321,z(:,120:4:156),'k-')
            hold on
            axis([0 321 -2 2])
            title(sprintf('%s',my_file))
            % keyboard   
        
    end
end
set(1, 'Position', [0 0 0.8*screen_size(3) 0.5*screen_size(4) ] );
export_fig(sprintf('./Midlines/excursions'),'-png','-nocrop')