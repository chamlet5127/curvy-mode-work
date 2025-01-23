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

% This was the main filewrite, the x20 was done later. If it needs to be
% redone uncomment the lines below.
allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
dirnames = ["VP5","V1","V2","V10"];

% % This was written because many of the codes failed when the viscosity was
% % reduced by a factor of 10. Only the uninjured were run at this viscosity.
% % allfiles= ["HM0NSAR2","HM4NSAR2"];
% % dirnames = ["VP1"];

% These are only for the x20 runs that I did later and separately
% % allfiles= ["SL150N4x20","SL50N4x20"]; 
% % dirnames = ["V2","V10"];

for i = 1:length(dirnames)
    for j = 1:length(allfiles)
        my_file=allfiles(j);
        [u1,E1,V1,kappa,meanKappa] = PCA_curvemean_fn(fullfile('./',dirnames(i),my_file));
        writematrix(meanKappa,sprintf('kappamean_%s_%s.csv',dirnames(i),my_file));
        writematrix(kappa,sprintf('kappa_%s_%s.csv',dirnames(i),my_file));
        writematrix(u1,sprintf('u_%s_%s.csv',dirnames(i),my_file));
        writematrix(E1,sprintf('E_%s_%s.csv',dirnames(i),my_file));
        writematrix(V1,sprintf('V_%s_%s.csv',dirnames(i),my_file));

    end
end