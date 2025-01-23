close all
clear all
clc

set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',20) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');

% allfiles= ["AO50N4","AO50NF","AO150N4","AO150NF","SL50N4","SL50NF","SL50N4x10","SL150N4","SL150NF","SL150N4x10","HM0NSAR2","HM4NSAR2","SL150N4x20","SL50N4x20"];  %% ,"HM4NSAR2"%% ,
% dirnames = ["V1","V2","VP5","V10"];

% These are only for the x20 runs that I did later and separately
allfiles= ["SL150N4x20","SL50N4x20"]; 
dirnames = ["V2","V10"];


for i = 1:length(dirnames);
    for j = 1:length(allfiles);
        my_file=allfiles(j);
        file_name=fullfile('./',dirnames(i),my_file,'fort.45');
        XY = dlmread(file_name);
        % % nfr=600;
        npt=321;
        nlines=4;
        [m,n]=size(XY);
        nfr = m/(npt*4);
        keyboard
    end
end
