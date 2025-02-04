close all
clear all
clc

set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',20) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');

fnamesAO50=["AO50N4","AO50NF"];
fnamesAO150=["AO150N4","AO150NF"];
fnamesSL50=["SL50N4","SL50NF","SL50N4x10"];
fnamesSL150=["SL150N4","SL150NF","SL150N4x10"];
dirnames = ["VisNorm","Vis2x","Vish"];

figure(1)
set(1, 'Position', [0 0 0.95*screen_size(3) 0.75*screen_size(4) ] );
t = tiledlayout('flow','TileSpacing','compact');

[mode1] = PCA_fn(fullfile('./','VisNorm','AO50NF'));
% subplot(3,4,1)
nexttile
plot(real(mode1))
hold on
plot(imag(mode1))
[mode2] = PCA_fn(fullfile('./','Vis2x','AO50NF'));
plot(real(mode2))
hold on
plot(imag(mode2))
[mode3] = PCA_fn(fullfile('./','Vish','AO50NF'));
plot(real(mode3))
hold on
plot(imag(mode3))
title('AO50')
ylabel('NF')
% % legend('Re','Im','2x Re','2x Im','half Re','half Im','Location','EastOutside')

[mode1] = PCA_fn(fullfile('./','VisNorm','AO150NF'));
% % subplot(3,4,2)
nexttile
plot(real(mode1))
hold on
plot(imag(mode1))
[mode2] = PCA_fn(fullfile('./','Vis2x','AO150NF'));
plot(real(mode2))
hold on
plot(imag(mode2))
[mode3] = PCA_fn(fullfile('./','Vish','AO150NF'));
plot(real(mode3))
hold on
plot(imag(mode3))
% % legend('Re','Im','2x Re','2x Im','half Re','half Im','Location','EastOutside')
title('AO150')


[mode1] = PCA_fn(fullfile('./','VisNorm','SL50NF'));
% % subplot(3,4,3)
nexttile
plot(real(mode1))
hold on
plot(imag(mode1))
[mode2] = PCA_fn(fullfile('./','Vis2x','SL50NF'));
plot(real(mode2))
hold on
plot(imag(mode2))
[mode3] = PCA_fn(fullfile('./','Vish','SL50NF'));
plot(real(mode3))
hold on
plot(imag(mode3))
% % legend('Re','Im','2x Re','2x Im','half Re','half Im','Location','EastOutside')
title('SL50')

[mode1] = PCA_fn(fullfile('./','VisNorm','SL150NF'));
% % subplot(3,4,4)
nexttile
plot(real(mode1))
hold on
plot(imag(mode1))
[mode2] = PCA_fn(fullfile('./','Vis2x','SL150NF'));
plot(real(mode2))
hold on
plot(imag(mode2))
[mode3] = PCA_fn(fullfile('./','Vish','SL150NF'));
plot(real(mode3))
hold on
plot(imag(mode3))
title('SL150')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mode1] = PCA_fn(fullfile('./','VisNorm','AO50N4'));
% % subplot(3,4,5)
nexttile
plot(real(mode1))
hold on
plot(imag(mode1))
[mode2] = PCA_fn(fullfile('./','Vis2x','AO50N4'));
plot(real(mode2))
hold on
plot(imag(mode2))
[mode3] = PCA_fn(fullfile('./','Vish','AO50N4'));
plot(real(mode3))
hold on
plot(imag(mode3))
% % legend('Re','Im','2x Re','2x Im','half Re','half Im','Location','EastOutside')
ylabel('N4')

[mode1] = PCA_fn(fullfile('./','VisNorm','AO150N4'));
% % subplot(3,4,6)
nexttile
plot(real(mode1))
hold on
plot(imag(mode1))
[mode2] = PCA_fn(fullfile('./','Vis2x','AO150N4'));
plot(real(mode2))
hold on
plot(imag(mode2))
[mode3] = PCA_fn(fullfile('./','Vish','AO150N4'));
plot(real(mode3))
hold on
plot(imag(mode3))
% % legend('Re','Im','2x Re','2x Im','half Re','half Im','Location','EastOutside')

[mode1] = PCA_fn(fullfile('./','VisNorm','SL50N4'));
% % subplot(3,4,7)
nexttile
plot(real(mode1))
hold on
plot(imag(mode1))
[mode2] = PCA_fn(fullfile('./','Vis2x','SL50N4'));
plot(real(mode2))
hold on
plot(imag(mode2))
[mode3] = PCA_fn(fullfile('./','Vish','SL50N4'));
plot(real(mode3))
hold on
plot(imag(mode3))
% % legend('Re','Im','2x Re','2x Im','half Re','half Im','Location','EastOutside')

[mode1] = PCA_fn(fullfile('./','VisNorm','SL150N4'));
% % subplot(3,4,8)
nexttile
plot(real(mode1))
hold on
plot(imag(mode1))
[mode2] = PCA_fn(fullfile('./','Vis2x','SL150N4'));
plot(real(mode2))
hold on
plot(imag(mode2))
[mode3] = PCA_fn(fullfile('./','Vish','SL150N4'));
plot(real(mode3))
hold on
plot(imag(mode3))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % [mode1] = PCA_fn(fullfile('./','Vis','AO50N4'))
% % subplot(3,4,5)
% % plot(real(mode1))
% % hold on
% % plot(imag(mode1))
% % [mode2] = PCA_fn(fullfile('./','Vis2x','AO50N4'))
% % plot(real(mode2))
% % hold on
% % plot(imag(mode2))
% % [mode3] = PCA_fn(fullfile('./','Vish','AO50N4'))
% % plot(real(mode3))
% % hold on
% % plot(imag(mode3))
% % legend('Re','Im','2x Re','2x Im','half Re','half Im','Location','EastOutside')

% % % [mode1] = PCA_fn(fullfile('./','Vis','AO150N4'))
% % % subplot(3,4,6)
% % % plot(real(mode1))
% % % hold on
% % % plot(imag(mode1))
% % % [mode2] = PCA_fn(fullfile('./','Vis2x','AO150N4'))
% % % plot(real(mode2))
% % % hold on
% % % plot(imag(mode2))
% % % [mode3] = PCA_fn(fullfile('./','Vish','AO150N4'))
% % % plot(real(mode3))
% % % hold on
% % % plot(imag(mode3))
% % % % % legend('Re','Im','2x Re','2x Im','half Re','half Im','Location','EastOutside')
nexttile
ylabel('x10')
nexttile
[mode1] = PCA_fn(fullfile('./','VisNorm','SL50N4x10'))
% % subplot(3,4,11)
nexttile
plot(real(mode1))
hold on
plot(imag(mode1))
[mode2] = PCA_fn(fullfile('./','Vis2x','SL50N4x10'))
plot(real(mode2))
hold on
plot(imag(mode2))
[mode3] = PCA_fn(fullfile('./','Vish','SL50N4x10'))
plot(real(mode3))
hold on
plot(imag(mode3))
% % legend('Re','Im','2x Re','2x Im','half Re','half Im','Location','EastOutside')
legend('Re','Im','2x Re','2x Im','half Re','half Im','Location','WestOutside')

[mode1] = PCA_fn(fullfile('./','VisNorm','SL150N4x10'))
% % subplot(3,4,12)
nexttile
plot(real(mode1))
hold on
plot(imag(mode1))
[mode2] = PCA_fn(fullfile('./','Vis2x','SL150N4x10'))
plot(real(mode2))
hold on
plot(imag(mode2))
[mode3] = PCA_fn(fullfile('./','Vish','SL150N4x10'))
plot(real(mode3))
hold on
plot(imag(mode3))

export_fig(['WaveForms'],'-png','-nocrop')
% % figure(1)
% % for i=1:nfr
% % plot(xn(:,i),yn(:,i),'-')
% % hold on
% % plot(comx(i),comy(i),'*')
% % axis([-70 20 5 8])
% % hold off
% % pause(0.1)
% % end