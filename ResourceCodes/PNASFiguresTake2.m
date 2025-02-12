clear all
close all
clc

set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',3)
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
screen_size = get(0, 'ScreenSize');
% % viridis=viridis();

nfr = 600;
nsegs = 321;
asegs = 280;
i = 1;
k = 1;
beg = 1;
daend = 280;
tot = 1000;

beg_frame = 200;
end_frame = nfr-1;
theta_segs = 319;
kappa_segs = 320;
nosc = 280;
tail_pos = 200;
curvature_file = 'fort.55555';
phase_file = 'fort.55554';
activation_file = 'fort.45';
dirname = './HM0NSAR2' ;


total_file = fullfile(dirname,phase_file);
theta = dlmread(total_file);
my_time1 = reshape(theta(:,1),theta_segs,nfr);
my_time = my_time1(1,:);
dt = (my_time(2)-my_time(1));

% % % % % % % % %%%% Figure 1
% % % % % % % % %%%% Schematic diagram of each type of injury
% % % % % % % % 
% % % % % % % % 
% % % % % % % % 
% % % % % % % % %%%% Figure 2
% % % % % % % % %%%% Screenshots from VisIt
% % % % % % % % 
% % % % % % % % %%
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % %%%% Figure 3
% % % % %%%% Blue-black plots
% % % % %%%% Phase Plots
% % % % 
% % % % dir_name_N4_150 = {'HM4NSAR2','SL150NF','SL150N4Mult4','SL150N4Mult10'};
% % % % dir_name_M8_150 = {'HM8MPA','SL150NF','SL150M8Mult4','SL150M8Mult10'};
% % % % dir_name_N4_50 = {'HM4NSAR2','SL50NF','SL50N4Mult4','SL50N4Mult10'};
% % % % dir_name_M8_50 = {'HM8MPA','SL50NF','SL50M8Mult4','SL50M8Mult10'};
% % % % dir_name_bb_files = {'HM4NSAR2','SL150NF','SL150N4Mult4','SL150N4Mult10',...
% % % %                      'SL150M8Mult4','SL150M8Mult10'};
% % % % rws = 2;
% % % % clmns = length(dir_name_bb_files);
% % % % figure(3)
% % % % set(3, 'Position', [0 0 0.8*screen_size(3) 0.6*screen_size(4) ] );
% % % % 
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % %  Plot N4 blue/black plots
% % % % dir_name = dir_name_bb_files;
% % % % for i = 1:length(dir_name)
% % % %     CheckActWaveFn(dir_name{i},rws,clmns,i);
% % % %     %     xlabel(dir_name{i})
% % % % end
% % % % 
% % % % subplot(2,6,1)
% % % % % title('SL Plots')
% % % % ylabel('Body Segment #')
% % % % 
% % % % 
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % %%%% Phase Plots
% % % % % %  Plot N4 Phase Plots
% % % % dir_name = dir_name_bb_files;
% % % % for i=1:length(dir_name)
% % % %     
% % % %     PlotPhasesFn(dir_name{i},rws,clmns,i+clmns)
% % % %     
% % % % end
% % % % % % 
% % % % % % % %  Plot M8 Phase Plots
% % % % % % dir_name=dir_name_M8_150;
% % % % % % for i=1:length(dir_name)
% % % % % %     
% % % % % %     PlotPhasesFn(dir_name{i},rws,clmns,i+2*clmns)
% % % % % %     
% % % % % % end
% % % % 
% % % % % % subplot(3,4,5)
% % % % % % ylabel('N4')
% % % % % % subplot(3,4,9)
% % % % % % ylabel('M8')
% % % % subplot(2,6,7)
% % % % % title('SL Plots')
% % % % ylabel('Phase (\theta)')
% % % % 
% % % % set(gcf,'color','w')
% % % % set(3, 'Position', [0 0 0.8*screen_size(3) 0.6*screen_size(4) ] );
% % % % export_fig('Figure3','-pdf','-nocrop')
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % 
% % % % 
% % % % %%
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % %%%% Figure 4
% % % % %%%% COM Speeds
% % % % %%%% Uninjured, x0, x1, x4, x10,
% % % % dir_name_N4_150 = {'HM4NSAR2','SL150N4','SL150N4Mult4','SL150N4Mult10','AO150N4'};
% % % % dir_name_M8_150 = {'HM8MPA','SL150M8','SL150M8Mult4','SL150M8Mult10','AO150M8'};
% % % % dir_name_N4_50 = {'HM4NSAR2','SL50N4','SL50N4Mult4','SL50N4Mult10','AO50N4'};
% % % % dir_name_M8_50 = {'HM8MPA','SL50M8','SL50M8Mult4','SL50M8Mult10','AO50M8'};
% % % % 
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % Calculating center of mass speed
% % % % % % N4 50
% % % % legend_names = {'base','x1','x4','x10','passive'}
% % % % figure(4)
% % % % subplot(2,4,5)
% % % % dir_name = dir_name_N4_50;
% % % % PlotCOMSpeedFn(dir_name, nfr, nsegs, asegs,my_time)
% % % % title('FB=M Injury=90')
% % % % % legend(legend_names)
% % % % set(4, 'Position', [0 0 0.8*screen_size(3) 0.6*screen_size(4) ] );
% % % % 
% % % % % % N4 150
% % % % figure(4)
% % % % subplot(2,4,6)
% % % % dir_name = dir_name_N4_150;
% % % % PlotCOMSpeedFn(dir_name, nfr, nsegs, asegs,my_time)
% % % % title('FB=M Injury=190')
% % % % % legend(dir_name_N4_150,'Location','EastOutside')
% % % % % legend(legend_names,'Location','SouthEast')
% % % % set(4, 'Position', [0 0 0.8*screen_size(3) 0.6*screen_size(4) ] );
% % % % 
% % % % % % M8 50
% % % % figure(4)
% % % % subplot(2,4,7)
% % % % dir_name = dir_name_M8_50;
% % % % PlotCOMSpeedFn(dir_name, nfr, nsegs, asegs,my_time)
% % % % % legend(dir_name_M8_50,'Location','SouthEast')
% % % % % legend(legend_names)
% % % % title('FB=M/D Injury=90')
% % % % set(4, 'Position', [0 0 0.8*screen_size(3) 0.6*screen_size(4) ] );
% % % % 
% % % % % % M8 50
% % % % figure(4)
% % % % subplot(2,4,8)
% % % % dir_name = dir_name_M8_150;
% % % % PlotCOMSpeedFn(dir_name, nfr, nsegs, asegs,my_time)
% % % % title('FB=M/D Injury=190')
% % % % legend(legend_names,'Location','SouthEast')
% % % % set(4, 'Position', [0 0 0.8*screen_size(3) 0.6*screen_size(4) ] );
% % % % set(gca,'box','off')
% % % % set(gcf,'color','w')
% % % % export_fig(['Figure4'],'-pdf','-nocrop')

% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % 
% % % % %%
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Figure 9
%%%% Activation Frequency and Body Plot
%%%% % 

dir_name_N4_150 = {'HM4NSAR2','SL150N4','SL150N4Mult4','SL150N4Mult10','AO150N4'};
dir_name_M8_150 = {'HM8MPA','SL150M8','SL150M8Mult4','SL150M8Mult10','AO150M8'};
dir_name_N4_50 = {'HM4NSAR2','SL50N4','SL50N4Mult4','SL50N4Mult10','AO50N4'};
dir_name_M8_50 = {'HM8MPA','SL50M8','SL50M8Mult4','SL50M8Mult10','AO50M8'};

figure(9)
subplot(2,4,1)
dir_name = dir_name_N4_50;
pullcut = 50;
PlotFreqFn(dir_name,phase_file,dt,pullcut,theta_segs,nfr,nosc);
title('SL50N4')
xticks([1 2 3 4])
xticklabels({'x0','x4','x10'})


figure(9)
subplot(2,4,2)
dir_name = dir_name_N4_150;
pullcut = 150;
PlotFreqFn(dir_name,phase_file,dt,pullcut,theta_segs,nfr,nosc);
title('SL150N4')
xticks([1 2 3 4])
xticklabels({'x0','x4','x10'})


figure(9)
subplot(2,4,3)
dir_name = dir_name_M8_50;
pullcut = 50;
PlotFreqFn(dir_name,phase_file,dt,pullcut,theta_segs,nfr,nosc);
title('SL50M8')
xticks([1 2 3 4])
xticklabels({'x0','x4','x10'})

% % 
figure(9)
subplot(2,4,4)
dir_name = dir_name_M8_150;
pullcut = 150;
PlotFreqFn(dir_name,phase_file,dt,pullcut,theta_segs,nfr,nosc);
title('SL150M8')
xticks([1 2 3 4])
xticklabels({'x0','x4','x10'})

subplot(2,4,1)
ylabel('frequency')

figure(9)
subplot(2,2,3)

A = dlmread('./HM0NSAR2/fort.31');
A1=reshape(A(:,1),size(A,1)/600,600);
A2=reshape(A(:,2),size(A,1)/600,600);
xvals=A1(:,1);
yvals=A2(:,1);
plot(xvals(1:321),yvals(1:321),'k-')
hold on
plot(xvals(322:642),yvals(322:642),'k-')
plot(xvals(643:963),yvals(643:963),'k-')
plot(xvals(964:1284),yvals(964:1284),'k-')
line([xvals(90) xvals(90)],[5.5 7])
set(gca, 'color', 'none');
set(gca,'xtick',[],'ytick',[])
set(gca, 'YColor','none')
% % axis off
xlabel('Injured at segment 90')
box off
axis([5 20 3 9])

subplot(2,2,4)

A = dlmread('./HM0NSAR2/fort.31');
A1=reshape(A(:,1),size(A,1)/600,600);
A2=reshape(A(:,2),size(A,1)/600,600);
xvals=A1(:,1);
yvals=A2(:,1);
plot(xvals(1:321),yvals(1:321),'k-')
hold on
plot(xvals(322:642),yvals(322:642),'k-')
plot(xvals(643:963),yvals(643:963),'k-')
plot(xvals(964:1284),yvals(964:1284),'k-')
line([xvals(190) xvals(190)],[5.5 7])
set(gca, 'color', 'none');
set(gca,'xtick',[],'ytick',[])
set(gca, 'YColor','none')
% % axis off
xlabel('Injured at segment 190')
box off
axis([5 20 3 9])

% % close all

set(9, 'Position', [0 0 0.80*screen_size(3) 0.70*screen_size(4) ] );
export_fig(['Figure9'],'-pdf','-nocrop')


%%
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % Figure 6
% % % % 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 7
% Cost of Transport

dir_name_N4_150 = {'HM4NSAR2','LC150N4','LC150N4Mult4','LC150N4Mult10','AO150N4'};
dir_name_M8_150 = {'HM8MPA','LC150M8','LC150M8Mult4','LC150M8Mult10','AO150M8'};
dir_name_N4_50 = {'HM4NSAR2','LC50N4','LC50N4Mult4','LC50N4Mult10','AO50N4'};
dir_name_M8_50 = {'HM8MPA','LC50M8','LC50M8Mult4','LC50M8Mult10','AO50M8'};

figure(7)
dir_name = dir_name_N4_50;
pullcut = 50;
case_name = 'SL50N4';
COTfn(pullcut,dir_name, nfr, nsegs, asegs, dt,theta_segs,nosc,my_time,beg,daend,case_name)
for_legend{1}=case_name;
hold on
dir_name = dir_name_N4_150;
pullcut = 150;
case_name = 'SL150N4';
COTfn(pullcut,dir_name, nfr, nsegs, asegs, dt,theta_segs,nosc,my_time,beg,daend,case_name)
for_legend{2}=case_name;

dir_name = dir_name_M8_50;
pullcut = 50;
case_name = 'SL50M8';
COTfn(pullcut,dir_name, nfr, nsegs, asegs, dt,theta_segs,nosc,my_time,beg,daend,case_name)
for_legend{3}=case_name;

dir_name = dir_name_M8_150;
pullcut = 150;
case_name = 'SL150M8';
COTfn(pullcut,dir_name, nfr, nsegs, asegs, dt,theta_segs,nosc,my_time,beg,daend,case_name)
for_legend{4}=case_name;

title('Cost of Transport')
axis([1 6 0 18])
xticks([2 3 4 5])
xticklabels({'x1','x4','x10','AO'})
legend(for_legend)

set(7, 'Position', [0 0 0.8*screen_size(3) 0.8*screen_size(4) ] );
export_fig(['Figure7'],'-png','-nocrop')

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Figure 8
% % COM Speeds
% % Uninjured, x0, x1, x4, x10,
dir_name_N4_150 = {'HM4NSAR2','LC150N4','LC150N4Mult4','LC150N4Mult10','AO150N4'};
dir_name_M8_150 = {'HM8MPA','LC150M8','LC150M8Mult4','LC150M8Mult10','AO150M8'};
dir_name_N4_50 = {'HM4NSAR2','LC50N4','LC50N4Mult4','LC50N4Mult10','AO50N4'};
dir_name_M8_50 = {'HM8MPA','LC50M8','LC50M8Mult4','LC50M8Mult10','AO50M8'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Calculating center of mass speed
% % % N4 50
figure(8)
subplot(2,2,1)
dir_name = dir_name_N4_50;
PlotCOMSpeedFn(dir_name, nfr, nsegs, asegs,my_time)
legend(dir_name_N4_50,'Location','EastOutside')
set(8, 'Position', [0 0 0.8*screen_size(3) 0.8*screen_size(4) ] );

% N4 150
figure(8)
subplot(2,2,2)
dir_name = dir_name_N4_150;
PlotCOMSpeedFn(dir_name, nfr, nsegs, asegs,my_time)
legend(dir_name_N4_150,'Location','EastOutside')
set(8, 'Position', [0 0 0.8*screen_size(3) 0.8*screen_size(4) ] );

% M8 50
figure(8)
subplot(2,2,3)
dir_name = dir_name_M8_50;
PlotCOMSpeedFn(dir_name, nfr, nsegs, asegs,my_time)
legend(dir_name_M8_50,'Location','EastOutside')
set(8, 'Position', [0 0 0.8*screen_size(3) 0.8*screen_size(4) ] );

% M8 50
figure(8)
subplot(2,2,4)
dir_name = dir_name_M8_150;
PlotCOMSpeedFn(dir_name, nfr, nsegs, asegs,my_time)
legend(dir_name_M8_150,'Location','EastOutside')
set(8, 'Position', [0 0 0.8*screen_size(3) 0.8*screen_size(4) ] );
export_fig(['Figure8'],'-png','-nocrop')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


