close all
clear all
clc

set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',10) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');
cmap=viridis();

allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
dirnames = ["VP5","V1","V2","V10"];
figure(1)
set(1, 'Position', [0 0 0.8*screen_size(3) 0.6*screen_size(4) ] );
tiledlayout(length(dirnames),length(allfiles))
% % allfiles= ["HM0NSAR2","HM4NSAR2"];
% % dirnames = ["VP1"];

for i = 1:length(dirnames);
    for j = 1:length(allfiles);
        my_file=allfiles(j);
        V = readmatrix(sprintf('V_%s_%s.csv',dirnames(i),my_file));
        E = readmatrix(sprintf('E_%s_%s.csv',dirnames(i),my_file));
        a=E*V';
        nexttile
       
        for k = 200:320
            % % % plot(a(1,k),a(2,k),'*','Color',[1*(size(a,2)-k)/size(a,2),0,(k)/size(a,2)])
            plot(a(1,k),a(2,k),'.','Color',[1*(320-k)/120,0,(k-200)/120])
            
            hold on
        end
        title(sprintf('%s',my_file))
        axis([-6 6 -6 6])
        % % xlabel("a_1")
        % % ylabel("a_2")
        grid off
    end

end
set(1, 'Position', [0 0 0.8*screen_size(3) 0.6*screen_size(4) ] );
export_fig(sprintf('./amp_ellipses'),'-png','-nocrop')