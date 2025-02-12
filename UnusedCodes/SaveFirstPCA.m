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


[mode1,mode2,excursion] = PCA_fn(fullfile('./','VisNorm','AO50NF'));
writematrix(mode1,'u1_AO50NF_VisNorm.csv');
writematrix(excursion,'exc_AO50NF_VisNorm.csv');
[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vis2x','AO50NF'));
writematrix(mode1,'u1_AO50NF_Vis2x.csv');
writematrix(excursion,'exc_AO50NF_Vis2x.csv');
[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vish','AO50NF'));
writematrix(mode1,'u1_AO50NF_VisHalf.csv');
writematrix(excursion,'exc_AO50NF_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mode1,mode2,excursion] = PCA_fn(fullfile('./','VisNorm','AO150NF'));
writematrix(mode1,'u1_AO150NF_VisNorm.csv');
writematrix(excursion,'exc_AO150NF_VisNorm.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vis2x','AO150NF'));
writematrix(mode1,'u1_AO150NF_Vis2x.csv');
writematrix(excursion,'exc_AO150NF_Vis2x.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vish','AO150NF'));
writematrix(mode1,'u1_AO150NF_VisHalf.csv');
writematrix(excursion,'exc_AO150NF_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mode1,mode2,excursion] = PCA_fn(fullfile('./','VisNorm','SL50NF'));
writematrix(mode1,'u1_SL50NF_VisNorm.csv');
writematrix(excursion,'exc_SL50NF_VisNorm.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vis2x','SL50NF'));
writematrix(mode1,'u1_SL50NF_Vis2x.csv');
writematrix(excursion,'exc_SL50NF_Vis2x.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vish','SL50NF'));
writematrix(mode1,'u1_SL50NF_VisHalf.csv');
writematrix(excursion,'exc_SL50NF_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mode1,mode2,excursion] = PCA_fn(fullfile('./','VisNorm','SL150NF'));
writematrix(mode1,'u1_SL150NF_VisNorm.csv');
writematrix(excursion,'exc_SL150NF_VisNorm.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vis2x','SL150NF'));
writematrix(mode1,'u1_SL150NF_Vis2x.csv');
writematrix(excursion,'exc_SL150NF_Vis2x.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vish','SL150NF'));
writematrix(mode1,'u1_SL150NF_VisHalf.csv');
writematrix(excursion,'exc_SL150NF_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mode1,mode2,excursion] = PCA_fn(fullfile('./','VisNorm','AO50N4'));
writematrix(mode1,'u1_AO50N4_VisNorm.csv');
writematrix(excursion,'exc_AO50N4_VisNorm.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vis2x','AO50N4'));
writematrix(mode1,'u1_AO50N4_Vis2x.csv');
writematrix(excursion,'exc_AO50N4_Vis2x.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vish','AO50N4'));
writematrix(mode1,'u1_AO50N4_VisHalf.csv');
writematrix(excursion,'exc_AO50N4_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mode1,mode2,excursion] = PCA_fn(fullfile('./','VisNorm','AO150N4'));
writematrix(mode1,'u1_AO150N4_VisNorm.csv');
writematrix(excursion,'exc_AO150N4_VisNorm.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vis2x','AO150N4'));
writematrix(mode1,'u1_AO150N4_Vis2x.csv');
writematrix(excursion,'exc_AO150N4_Vis2x.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vish','AO150N4'));
writematrix(mode1,'u1_AO150N4_VisHalf.csv');
writematrix(excursion,'exc_AO150N4_VisHalf.csv');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mode1,mode2,excursion] = PCA_fn(fullfile('./','VisNorm','SL50N4'));
writematrix(mode1,'u1_SL50N4_VisNorm.csv');
writematrix(excursion,'exc_SL50N4_VisNorm.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vis2x','SL50N4'));
writematrix(mode1,'u1_SL50N4_Vis2x.csv');
writematrix(excursion,'exc_SL50N4_Vis2x.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vish','SL50N4'));
writematrix(mode1,'u1_SL50N4_VisHalf.csv');
writematrix(excursion,'exc_SL50N4_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mode1,mode2,excursion] = PCA_fn(fullfile('./','VisNorm','SL150N4'));
writematrix(mode1,'u1_SL150N4_VisNorm.csv');
writematrix(excursion,'exc_SL150N4_VisNorm.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vis2x','SL150N4'));
writematrix(mode1,'u1_SL150N4_Vis2x.csv');
writematrix(excursion,'exc_SL150N4_Vis2x.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vish','SL150N4'));
writematrix(mode1,'u1_SL150N4_VisHalf.csv');
writematrix(excursion,'exc_SL150N4_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mode1,mode2,excursion] = PCA_fn(fullfile('./','VisNorm','SL50N4x10'));
writematrix(mode1,'u1_SL50N4x10_VisNorm.csv');
writematrix(excursion,'exc_SL50N4x10_VisNorm.csv');
[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vis2x','SL50N4x10'));
writematrix(mode1,'u1_SL50N4x10_Vis2x.csv');
writematrix(excursion,'exc_SL50N4x10_Vis2x.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vish','SL50N4x10'));
writematrix(mode1,'u1_SL50N4x10_VisHalf.csv');
writematrix(excursion,'exc_SL50N4x10_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mode1,mode2,excursion] = PCA_fn(fullfile('./','VisNorm','SL150N4x10'));
writematrix(mode1,'u1_SL150N4x10_VisNorm.csv');
writematrix(excursion,'exc_SL150N4x10_VisNorm.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vis2x','SL150N4x10'));
writematrix(mode1,'u1_SL150N4x10_Vis2x.csv');
writematrix(excursion,'exc_SL150N4x10_Vis2x.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vish','SL150N4x10'));
writematrix(mode1,'u1_SL150N4x10_VisHalf.csv');
writematrix(excursion,'exc_SL150N4x10_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mode1,mode2,excursion] = PCA_fn(fullfile('./','VisNorm','HM0NSAR2'));
writematrix(mode1,'u1_HM0NSAR2_VisNorm.csv');
writematrix(excursion,'exc_HM0NSAR2_VisNorm.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vis2x','HM0NSAR2'));
writematrix(mode1,'u1_HM0NSAR2_Vis2x.csv');
writematrix(excursion,'exc_HM0NSAR2_Vis2x.csv');

[mode1,mode2,excursion] = PCA_fn(fullfile('./','Vish','HM0NSAR2'));
writematrix(mode1,'u1_HM0NSAR2_VisHalf.csv');
writematrix(excursion,'exc_HM0NSAR2_VisHalf.csv');
