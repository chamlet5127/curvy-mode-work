close all
clear all
clc
% This calculates the COM speed 

set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',20) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');
% % cm_mymap = my_map();
cm_mymap=viridis();
% This was the main filewrite, the x20 was done later. If it needs to be
% redone uncomment the lines below.
allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
dirnames = ["VP5","V1","V2","V10"];


% These are only for the x20 runs that I did later and separately
% % allfiles= ["SL150N4x20","SL50N4x20"];
% % dirnames = ["V2","V10"];
nsegs = 321;
asegs = 280;
% % figure(1)
% % tiledlayout('vertical')

for j = 1:length(allfiles);  
    % nexttile
    figure(j)
for i = 1:length(dirnames);
        % % figure((j-1)*length(allfiles)+i)
        % % 
        my_file=allfiles(j);
        file_name=fullfile('./',dirnames(i),my_file);
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
        com_speed = sqrt(comvelx1.^2 + comvely1.^2);
        writematrix(com_speed,sprintf('Excursions/comspeed_%s_%s.csv',dirnames(i),my_file));
        plot(my_time,com_speed,'Color',cm_mymap(i*60,:))
        axis([0 15 0 8])
        hold on
        % % % pause(0.1)
        
        % % % % keyboard
        % % export_fig(sprintf('./Midlines/mid_%s-%s',dirnames(i),my_file),'-png','-nocrop')
        % % clf
    end
    legend("x0.5","x1","x2","x10",'Location','NorthEast')
    title(sprintf('%s',my_file))
    set(j, 'Position', [0 0 0.8*screen_size(3) 0.8*screen_size(4) ] );
    %export_fig(sprintf('./COMSpeed/com_%s',my_file),'-png','-nocrop')

    
end

    % % clf
% % % cm_mymap=viridis();
% % cm_mymap = my_map();
% % com_speed = cell(1,length(dir_name));
% % counter = 0;
% % n = length(dir_name);
% % for i=1:length(dir_name)
% %
% %     [xm, xn, xl, xr, ym, yn, yl, yr] = import_positions(dir_name{i}, nfr, nsegs, asegs);
% %
% %     [width1,area1,sn1, comx1,comy1,comvelx1,comvely1] = estcomspeed(my_time,xm,ym,xn,yn,xl,xr,yl,yr);
% %     com_speed{i} = sqrt(comvelx1.^2 + comvely1.^2);
% %
% %       plot(my_time,com_speed{i},'Color',cm_mymap(i,:))
% % % % %     if i == length(dir_name)
% % % % %         plot(my_time,com_speed{length(dir_name)},'Color', [0 0.5410 0.0470])
% % % % %     elseif i == 1
% % % % %         plot(my_time,com_speed{1},'Color', [0 0.2470 0.7410])
% % % % %     else
% % % % %         plot(my_time,com_speed{i},'Color',[0.75*(1-(n-counter)/n),0.75*(1-(n-counter)/n),0.75*(1-(n-counter)/n)])
% % % % %     end
% %     hold on
% %     axis([0 15 0 6])
% %     xlabel('time (s)')
% %     ylabel('speed (L/s)')
% % %     title('COM Speed')
% %     counter = counter + 1;
% % end
