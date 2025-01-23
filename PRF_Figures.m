close all
clear all
clc

set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',10) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');
cm_mymap=viridis();
tiledlayout('flow')
nsegs = 321;
asegs = 280;
nfr = 600;

%List of figures:

% Center of mass speeds
% Uninjured no feedback each viscosity
% Uninjured with feedback each viscosity
% Injuries with feedback and viscosity
% Make a map of COM speed averages for each case

% First get all of the COM speeds

allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
dirnames = ["VP5","V1","V2","V10"];

for j = 1:length(allfiles);
    % nexttile
    %figure(j)
    for i = 1:length(dirnames);
        % % figure((j-1)*length(allfiles)+i)
        % %
        allfiles(j)=allfiles(j);
        file_name=fullfile('./',dirnames(i),allfiles(j));
        XY = dlmread(file_name);
        % % nfr=600;
        npt=321;
        nlines=4;
        [m,n]=size(XY);
        nfr = m/(npt*4);
        my_vec=1:nfr;
        my_time = 0.025*my_vec;
        x_vals = reshape(XY(:,1),4*npt,nfr);
        y_vals = reshape(XY(:,2),4*npt,nfr);

        xm = x_vals(1:npt,:);
        xn = x_vals(npt+1:2*npt,:);  % Need this one
        xl = x_vals(2*npt+1:3*npt,:);
        xr = x_vals(3*npt+1:4*npt,:);

        ym = y_vals(1:npt,:);
        yn = y_vals(npt+1:2*npt,:);   % Need this one
        yl = y_vals(2*npt+1:3*npt,:);
        yr = y_vals(3*npt+1:4*npt,:);

        [width1,area1,sn1, comx1,comy1,comvelx1,comvely1] = estcomspeed(my_time,xm,ym,xn,yn,xl,xr,yl,yr);
        com_speed{i,j} = sqrt(comvelx1.^2 + comvely1.^2);
        mean_com_speed(i,j)=mean(com_speed{i,j}(320:440));
      
    end
   
end
close all
bar(1:12,mean_com_speed)
ylabel("Body Lengths per Second (L/s)")
xticks(1:12)
xticklabels({"HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"})
legend("x1/2","x1","x2","x10","Location","EastOutside")
title("Mean Center of Mass Speed")
set(1, 'Position', [0 0 0.8*screen_size(3) 0.8*screen_size(4) ] );
export_fig(sprintf('./COMSpeed/mean_com'),'-png','-nocrop')