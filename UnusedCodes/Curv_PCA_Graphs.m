% % close all
clear all
clc

% u_   loads curvature PCA (no mean removal)
% exc_ load the excursion
% u1_  loads the excursion COD PCA
% mean_svd loads the curvature PCA with the mean subtracted

set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',20) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');

fnames=["AO50N4","AO50NF",...
        "AO150N4","AO150NF","SL50N4",...
        "SL50NF","SL50N4x10",...
        "SL150N4","SL150NF","SL150N4x10"];

dirnames = ["VisNorm","Vis2x","Vish"];

figure(1)
clf
set(1, 'Position', [0 0 0.95*screen_size(3) 0.75*screen_size(4) ] );
t = tiledlayout('flow','TileSpacing','compact');
figure(2)
clf
set(2, 'Position', [0 0 0.95*screen_size(3) 0.75*screen_size(4) ] );
s = tiledlayout('flow','TileSpacing','compact');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % for i = 1:length(fnames)

my_file = 'AO50NF';
u1 = readmatrix(sprintf('u_%s_VisNorm.csv',my_file));
figure(1)
nexttile
plot(u1(:,1))
hold on
figure(2)
nexttile
plot(u1(:,2))
hold on

u2 = readmatrix(sprintf('u_%s_Vis2x.csv',my_file));
figure(1)
plot(u2(:,1))
hold on
figure(2)
plot(u2(:,2))
hold on

u3 = readmatrix(sprintf('u_%s_VisHalf.csv',my_file));
figure(1)
plot(u3(:,1))
hold on
title('AO50')
ylabel('NF')

figure(2)
plot(u3(:,2))
hold on
title('AO50')
ylabel('NF')

% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_file = 'AO150NF';
u1 = readmatrix(sprintf('u_%s_VisNorm.csv',my_file));

figure(1)
nexttile
plot(u1(:,1))
hold on
figure(2)
nexttile
plot(u1(:,2))
hold on

u2 = readmatrix(sprintf('u_%s_Vis2x.csv',my_file));
figure(1)
plot(u2(:,1))
hold on
figure(2)
plot(u2(:,2))
hold on

u3 = readmatrix(sprintf('u_%s_VisHalf.csv',my_file));
figure(1)
plot(u3(:,1))
hold on
title('AO150')

figure(2)
plot(u3(:,2))
hold on
title('AO150')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_file = 'SL50NF';
u1 = readmatrix(sprintf('u_%s_VisNorm.csv',my_file));
figure(1)
nexttile
plot(u1(:,1))
hold on

figure(2)
nexttile
plot(u1(:,2))
hold on

u2 = readmatrix(sprintf('u_%s_Vis2x.csv',my_file));
figure(1)
plot(u2(:,1))
hold on

figure(2)
plot(u2(:,2))
hold on

u3 = readmatrix(sprintf('u_%s_VisHalf.csv',my_file));
figure(1)
plot(u3(:,1))
hold on
title('SL50')

figure(2)
plot(u3(:,2))
hold on
% % legend('Re','Im','2x Re','2x Im','half Re','half Im','Location','EastOutside')
title('SL50')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_file = 'SL150NF';
u1 = readmatrix(sprintf('u_%s_VisNorm.csv',my_file));
figure(1)
nexttile
plot(u1(:,1))
hold on

figure(2)
nexttile
plot(u1(:,2))
hold on

u2 = readmatrix(sprintf('u_%s_Vis2x.csv',my_file));
figure(1)
plot(u2(:,1))
hold on

figure(2)
plot(u2(:,2))
hold on

u3 = readmatrix(sprintf('u_%s_VisHalf.csv',my_file));
figure(1)
plot(u3(:,1))
hold on
title('SL150')

figure(2)
plot(u3(:,2))
hold on
title('SL150')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_file = 'AO50N4';
u1 = readmatrix(sprintf('u_%s_VisNorm.csv',my_file));
figure(1)
nexttile
plot(u1(:,1))
hold on

figure(2)
nexttile
plot(u1(:,2))
hold on

u2 = readmatrix(sprintf('u_%s_Vis2x.csv',my_file));
figure(1)
plot(u2(:,1))
hold on

figure(2)
plot(u2(:,2))
hold on

u3 = readmatrix(sprintf('u_%s_VisHalf.csv',my_file));
figure(1)
plot(u3(:,1))
hold on
ylabel('N4')

figure(2)
plot(u3(:,2))
hold on
ylabel('N4')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_file = 'AO150N4';
u1 = readmatrix(sprintf('u_%s_VisNorm.csv',my_file));
figure(1)
nexttile
plot(u1(:,1))
hold on

figure(2)
nexttile
plot(u1(:,2))
hold on

u2 = readmatrix(sprintf('u_%s_Vis2x.csv',my_file));
figure(1)
plot(u2(:,1))
hold on

figure(2)
plot(u2(:,2))
hold on

u3 = readmatrix(sprintf('u_%s_VisHalf.csv',my_file));
figure(1)
plot(u3(:,1))
hold on

figure(2)
plot(u3(:,2))
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_file = 'SL50N4';
u1 = readmatrix(sprintf('u_%s_VisNorm.csv',my_file));
figure(1)
nexttile
plot(u1(:,1))
hold on

figure(2)
nexttile
plot(u1(:,2))
hold on

u2 = readmatrix(sprintf('u_%s_Vis2x.csv',my_file));
figure(1)
plot(u2(:,1))
hold on

figure(2)
plot(u2(:,2))
hold on

u3 = readmatrix(sprintf('u_%s_VisHalf.csv',my_file));
figure(1)
plot(u3(:,1))
hold on

figure(2)
plot(u3(:,2))
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_file = 'SL150N4';
u1 = readmatrix(sprintf('u_%s_VisNorm.csv',my_file));
figure(1)
nexttile
plot(u1(:,1))
hold on

figure(2)
nexttile
plot(u1(:,2))
hold on

u2 = readmatrix(sprintf('u_%s_Vis2x.csv',my_file));
figure(1)
plot(u2(:,1))
hold on

figure(2)
plot(u2(:,2))
hold on

u3 = readmatrix(sprintf('u_%s_VisHalf.csv',my_file));
figure(1)
plot(u3(:,1))
hold on

figure(2)
plot(u3(:,2))
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
nexttile
ylabel('x10')
nexttile

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
nexttile
ylabel('x10')
nexttile

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_file = 'SL50N4x10';
u1 = readmatrix(sprintf('u_%s_VisNorm.csv',my_file));
figure(1)
nexttile
plot(u1(:,1))
hold on

figure(2)
nexttile
plot(u1(:,2))
hold on

u2 = readmatrix(sprintf('u_%s_Vis2x.csv',my_file));
figure(1)
plot(u2(:,1))
hold on
figure(2)
plot(u2(:,2))
hold on

u3 = readmatrix(sprintf('u_%s_VisHalf.csv',my_file));
figure(1)
plot(u3(:,1))
hold on

figure(2)
plot(u3(:,2))
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
legend('1st','2x 1st','half 1st','Location','WestOutside')

figure(2)
legend('2nd','2x 2nd','half 2nd','Location','WestOutside')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_file = 'SL150N4x10';
u1 = readmatrix(sprintf('u_%s_VisNorm.csv',my_file));
figure(1)
nexttile
plot(u1(:,1))
hold on

figure(2)
nexttile
plot(u1(:,2))
hold on

u2 = readmatrix(sprintf('u_%s_Vis2x.csv',my_file));
figure(1)
plot(u2(:,1))
hold on

figure(2)
plot(u2(:,2))
hold on

u3 = readmatrix(sprintf('u_%s_VisHalf.csv',my_file));
figure(1)
plot(u3(:,1))
hold on

figure(2)
plot(u3(:,2))
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
export_fig(['Cur_WaveForms1st'],'-png','-nocrop')

figure(2)
export_fig(['Cur_WaveForms2nd'],'-png','-nocrop')
