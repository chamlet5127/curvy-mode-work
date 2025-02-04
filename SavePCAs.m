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

% % 
[u1,E1,V1,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','VisNorm','AO50NF'));
writematrix(u1,'u_AO50NF_VisNorm.csv');
writematrix(smoothedKappa,'smooth_curve_AO50NF_VisNorm.csv');
writematrix(kappa,'curve_AO50NF_VisNorm.csv');
[u2,E2,V2,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vis2x','AO50NF'));
writematrix(u2,'u_AO50NF_Vis2x.csv');
writematrix(smoothedKappa,'smooth_curve_AO50NF_Vis2x.csv');
writematrix(kappa,'curve_AO50NF_Vis2x.csv');
[u3,E3,V3,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vish','AO50NF'));
writematrix(u3,'u_AO50NF_VisHalf.csv');
writematrix(smoothedKappa,'smooth_curve_AO50NF_VisHalf.csv');
writematrix(kappa,'curve_AO50NF_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','VisNorm','AO150NF'));
writematrix(u1,'u_AO150NF_VisNorm.csv');
writematrix(smoothedKappa,'smooth_curve_AO150NF_VisNorm.csv');
writematrix(kappa,'curve_AO150NF_VisNorm.csv');
[u2,E2,V2,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vis2x','AO150NF'));
writematrix(u2,'u_AO150NF_Vis2x.csv');
writematrix(smoothedKappa,'smooth_curve_AO150NF_Vis2x.csv');
writematrix(kappa,'curve_AO150NF_Vis2x.csv');
[u3,E3,V3,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vish','AO150NF'));
writematrix(u3,'u_AO150NF_VisHalf.csv');
writematrix(smoothedKappa,'smooth_curve_AO150NF_VisHalf.csv');
writematrix(kappa,'curve_AO150NF_VisHalf.csv');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','VisNorm','SL50NF'));
writematrix(u1,'u_SL50NF_VisNorm.csv');
writematrix(smoothedKappa,'smooth_curve_SL50NF_VisNorm.csv');
writematrix(kappa,'curve_SL50NF_VisNorm.csv');
[u2,E2,V2,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vis2x','SL50NF'));
writematrix(u2,'u_SL50NF_Vis2x.csv');
writematrix(smoothedKappa,'smooth_curve_SL50NF_Vis2x.csv');
writematrix(kappa,'curve_SL50NF_Vis2x.csv');
[u3,E3,V3,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vish','SL50NF'));
writematrix(u3,'u_SL50NF_VisHalf.csv');
writematrix(smoothedKappa,'smooth_curve_SL50NF_VisHalf.csv');
writematrix(kappa,'curve_SL50NF_VisHalf.csv');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','VisNorm','SL150NF'));
writematrix(u1,'u_SL150NF_VisNorm.csv');
writematrix(smoothedKappa,'smooth_curve_SL150NF_VisNorm.csv');
writematrix(kappa,'curve_SL150NF_VisNorm.csv');
[u2,E2,V2,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vis2x','SL150NF'));
writematrix(u2,'u_SL150NF_Vis2x.csv');
writematrix(smoothedKappa,'smooth_curve_SL150NF_Vis2x.csv');
writematrix(kappa,'curve_SL150NF_Vis2x.csv');
[u3,E3,V3,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vish','SL150NF'));
writematrix(u3,'u_SL150NF_VisHalf.csv');
writematrix(smoothedKappa,'smooth_curve_SL150NF_VisHalf.csv');
writematrix(kappa,'curve_SL150NF_VisHalf.csv');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','VisNorm','AO50N4'));
writematrix(u1,'u_AO50N4_VisNorm.csv');
writematrix(smoothedKappa,'smooth_curve_AO50N4_VisNorm.csv');
writematrix(kappa,'curve_AO50N4_VisNorm.csv');
[u2,E2,V2,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vis2x','AO50N4'));
writematrix(u2,'u_AO50N4_Vis2x.csv');
writematrix(smoothedKappa,'smooth_curve_AO50N4_Vis2x.csv');
writematrix(kappa,'curve_AO50N4_Vis2x.csv');
[u3,E3,V3,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vish','AO50N4'));
writematrix(u3,'u_AO50N4_VisHalf.csv');
writematrix(smoothedKappa,'smooth_curve_AO50N4_VisHalf.csv');
writematrix(kappa,'curve_AO50N4_VisHalf.csv');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','VisNorm','AO150N4'));
writematrix(u1,'u_AO150N4_VisNorm.csv');
writematrix(smoothedKappa,'smooth_curve_AO150N4_VisNorm.csv');
writematrix(kappa,'curve_AO150N4_VisNorm.csv');

[u2,E2,V2,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vis2x','AO150N4'));
writematrix(u2,'u_AO150N4_Vis2x.csv');
writematrix(smoothedKappa,'smooth_curve_AO150N4_Vis2x.csv');
writematrix(kappa,'curve_AO150N4_Vis2x.csv');

[u3,E3,V3,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vish','AO150N4'));
writematrix(u3,'u_AO150N4_VisHalf.csv');
writematrix(smoothedKappa,'smooth_curve_AO150N4_VisHalf.csv');
writematrix(kappa,'curve_AO150N4_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','VisNorm','SL50N4'));
writematrix(u1,'u_SL50N4_VisNorm.csv');
writematrix(smoothedKappa,'smooth_curve_SL50N4_VisNorm.csv');
writematrix(kappa,'curve_SL50N4_VisNorm.csv');

[u2,E2,V2,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vis2x','SL50N4'));
writematrix(u2,'u_SL50N4_Vis2x.csv');
writematrix(smoothedKappa,'smooth_curve_SL50N4_Vis2x.csv');
writematrix(kappa,'curve_SL50N4_Vis2x.csv');

[u3,E3,V3,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vish','SL50N4'));
writematrix(u3,'u_SL50N4_VisHalf.csv');
writematrix(smoothedKappa,'smooth_curve_SL50N4_VisHalf.csv');
writematrix(kappa,'curve_SL50N4_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','VisNorm','SL150N4'));
writematrix(u1,'u_SL150N4_VisNorm.csv');
writematrix(smoothedKappa,'smooth_curve_SL150N4_VisNorm.csv');
writematrix(kappa,'curve_SL150N4_VisNorm.csv');

[u2,E2,V2,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vis2x','SL150N4'));
writematrix(u2,'u_SL150N4_Vis2x.csv');
writematrix(smoothedKappa,'smooth_curve_SL150N4_Vis2x.csv');
writematrix(kappa,'curve_SL150N4_Vis2x.csv');

[u3,E3,V3,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vish','SL150N4'));
writematrix(u3,'u_SL150N4_VisHalf.csv');
writematrix(smoothedKappa,'smooth_curve_SL150N4_VisHalf.csv');
writematrix(kappa,'curve_SL150N4_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','VisNorm','SL50N4x10'));
writematrix(u1,'u_SL50N4x10_VisNorm.csv');
writematrix(smoothedKappa,'smooth_curve_SL50N4x10_VisNorm.csv');
writematrix(kappa,'curve_SL50N4x10_VisNorm.csv');
[u2,E2,V2,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vis2x','SL50N4x10'));
writematrix(u2,'u_SL50N4x10_Vis2x.csv');
writematrix(smoothedKappa,'smooth_curve_SL50N4x10_Vis2x.csv');
writematrix(kappa,'curve_SL50N4x10_Vis2x.csv');

[u3,E3,V3,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vish','SL50N4x10'));
writematrix(u3,'u_SL50N4x10_VisHalf.csv');
writematrix(smoothedKappa,'smooth_curve_SL50N4x10_VisHalf.csv');
writematrix(kappa,'curve_SL50N4x10_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','VisNorm','SL150N4x10'));
writematrix(u1,'u_SL150N4x10_VisNorm.csv');
writematrix(smoothedKappa,'smooth_curve_SL150N4x10_VisNorm.csv');
writematrix(kappa,'curve_SL150N4x10_VisNorm.csv');

[u2,E2,V2,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vis2x','SL150N4x10'));
writematrix(u2,'u_SL150N4x10_Vis2x.csv');
writematrix(smoothedKappa,'smooth_curve_SL150N4x10_Vis2x.csv');
writematrix(kappa,'curve_SL150N4x10_Vis2x.csv');

[u3,E3,V3,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vish','SL150N4x10'));
writematrix(u3,'u_SL150N4x10_VisHalf.csv');
writematrix(smoothedKappa,'smooth_curve_SL150N4x10_VisHalf.csv');
writematrix(kappa,'curve_SL150N4x10_VisHalf.csv');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','VisNorm','HM0NSAR2'));
writematrix(u1,'u1_HM0NSAR2_VisNorm.csv');
writematrix(smoothedKappa,'smooth_curve_HM0NSAR2_VisNorm.csv');
writematrix(kappa,'curve_HM0NSAR2_VisNorm.csv');

[u2,E2,V2,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vis2x','HM0NSAR2'));
writematrix(u2,'u1_HM0NSAR2_Vis2x.csv');
writematrix(smoothedKappa,'smooth_curve_HM0NSAR2_Vis2x.csv');
writematrix(kappa,'curve_HM0NSAR2_Vis2x.csv');

[u3,E3,V3,kappa,smoothedKappa] = PCA_curve_fn(fullfile('./','Vish','HM0NSAR2'));
writematrix(u3,'u1_HM0NSAR2_VisHalf.csv');
writematrix(smoothedKappa,'smooth_curve_HM0NSAR2_VisHalf.csv');
writematrix(kappa,'curve_HM0NSAR2_VisHalf.csv');
