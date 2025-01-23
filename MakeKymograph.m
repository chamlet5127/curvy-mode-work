close all
clear all
clc

set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',20) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');

% % my_file = 'SL50N4';
% % u1 = readmatrix(sprintf('kappa_V1_%s.csv',my_file));
% % [m,n]=size(u1);
% % pcolor(u1(1:4:end,1:4:end)*4*pi)
%yvals = 

nlines=4;
allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
dirnames = ["VP5","V1","V2","V10"];
figure(1)
tiledlayout(length(dirnames),length(allfiles))
% % writematrix(u1,sprintf('u_%s_%s.csv',my_file,dirnames(i)));
% %
xax=200:320;
xax=xax*0.025;
yax=1:321;
for i = 1:length(dirnames);
    for j = 1:length(allfiles);
        % % figure(i*j)
        my_file=allfiles(j);
        u1 = readmatrix(sprintf('kappa_%s_%s.csv',dirnames(i),my_file));
        % % u1(1:end,1:end)=u1(end:-1:1,1:end);
        % % [m,n]=size(u1);
        % % [X,Y]=meshgrid(1:m,1:n);
        nexttile
        s=pcolor(xax,yax,u1(:,200:320));
        shading flat
        caxis([-0.8, 0.8]);
        % % s.EdgeColor = 'none';
        % % title(sprintf('kappa, %s-%s',dirnames(i),my_file))
        title(sprintf('%s',my_file))
        % % colorbar
        % % xlabel("time (s)")
        % % ylabel("body position (segment)")
        % % grid off
        % % export_fig(sprintf('./Kymograph/%s-%s',dirnames(i),my_file),'-png','-nocrop')
        % % pause(0.1)
        
    end
end

set(1, 'Position', [0 0 0.9*screen_size(3) 0.6*screen_size(4) ] );
export_fig(sprintf('./Kymograph/kymall'),'-png','-nocrop')
% % close all
% % % % keyboard
% % allfiles= ["HM0NSAR2","HM4NSAR2"];
% % dirnames = ["VP1"];
% % for i = 1:length(dirnames);
% %     for j = 1:length(allfiles);
% %         figure(i*j*100)
% %         my_file=allfiles(j);
% %         u1 = readmatrix(sprintf('kappa_%s_%s.csv',dirnames(i),my_file));
% %         % % u1(1:end,1:end)=u1(end:-1:1,1:end);
% %         % % [m,n]=size(u1);
% %         % % [X,Y]=meshgrid(1:m,1:n);
% %         s=pcolor(xax,yax,u1(:,200:320));
% %         shading flat
% %         caxis([-0.8, 0.8]);
% %         % % s.EdgeColor = 'none';
% %         title(sprintf('kappa, %s-%s',dirnames(i),my_file))
% %         colorbar
% %         xlabel("time (s)")
% %         ylabel("body position (segment)")
% %         grid off
% %         export_fig(sprintf('./Kymograph/%s-%s',dirnames(i),my_file),'-png','-nocrop')
% %         pause(0.1)
% % 
% %     end
% % end