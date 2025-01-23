close all
clear all
clc
set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',20) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');

% This was the main filewrite, the x20 was done later. If it needs to be
% redone uncomment the lines below.
allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"];  %% ,"HM4NSAR2"%% ,
dirnames = ["VP5","V1","V2","V10"];
figure(1)
tiledlayout(length(dirnames),length(allfiles))
% These are only for the x20 runs that I did later and separately
% % allfiles= ["SL150N4x20","SL50N4x20"];
% % dirnames = ["V2","V10"];
for i = 1:length(dirnames);
    for j = 1:length(allfiles);
        my_file=allfiles(j);

        file_name=fullfile('./',dirnames(i),my_file);
        XY = dlmread(file_name);
        npt=321;
        nlines=4;
        [m,n]=size(XY);
        nfr = m/(npt*4);

        x_vals = reshape(XY(:,1),4*npt,nfr);
        y_vals = reshape(XY(:,2),4*npt,nfr);

        xm = x_vals(1:npt,:);
        ym = y_vals(1:npt,:);
        nexttile
            plot(xm(:,120:4:160)-xm(1,120:4:160)+0.5,ym(:,120:4:160),'k-')
            hold on
            axis([0 14 4 9])
            
          title(sprintf('%s',my_file))
        
    end
end
set(1, 'Position', [0 0 0.8*screen_size(3) 0.8*screen_size(4) ] );
export_fig(sprintf('./Midlines/midall'),'-png','-nocrop')
% % export_fig(sprintf('./Midlines/mid_%s-%s',dirnames(i),my_file),'-png','-nocrop')