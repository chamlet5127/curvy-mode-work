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
[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','VisNorm','AO50NF'));
writematrix(smoothedKappa,'mean_curve_AO50NF_VisNorm.csv');
writematrix(u1,'mean_svd_AO50NF_VisNorm.csv');
[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vis2x','AO50NF'));
writematrix(smoothedKappa,'mean_curve_AO50NF_Vis2x.csv');
writematrix(u1,'mean_svd_AO50NF_Vis2x.csv');

[u,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vish','AO50NF'));
writematrix(smoothedKappa,'mean_curve_AO50NF_VisHalf.csv');
writematrix(u1,'mean_svd_AO50NF_VisHalf.csv');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','VisNorm','AO150NF'));
writematrix(smoothedKappa,'mean_curve_AO150NF_VisNorm.csv');
writematrix(u1,'mean_svd_AO150NF_VisNorm.csv');

[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vis2x','AO150NF'));
writematrix(smoothedKappa,'mean_curve_AO150NF_Vis2x.csv');
writematrix(u1,'mean_svd_AO150NF_Vis2x.csv');

[u,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vish','AO150NF'));
writematrix(smoothedKappa,'mean_curve_AO150NF_VisHalf.csv');
writematrix(u1,'mean_svd_AO150NF_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','VisNorm','SL50NF'));
writematrix(smoothedKappa,'mean_curve_SL50NF_VisNorm.csv');
writematrix(u1,'mean_svd_SL50NF_VisNorm.csv');

[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vis2x','SL50NF'));
writematrix(smoothedKappa,'mean_curve_SL50NF_Vis2x.csv');
writematrix(u1,'mean_svd_SL50NF_Vis2x.csv');

[u,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vish','SL50NF'));
writematrix(smoothedKappa,'mean_curve_SL50NF_VisHalf.csv');
writematrix(u1,'mean_svd_SL50NF_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','VisNorm','SL150NF'));
writematrix(smoothedKappa,'mean_curve_SL150NF_VisNorm.csv');
writematrix(u1,'mean_svd_SL150NF_VisNorm.csv');

[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vis2x','SL150NF'));
writematrix(smoothedKappa,'mean_curve_SL150NF_Vis2x.csv');
writematrix(u1,'mean_svd_SL150NF_Vis2x.csv');

[u,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vish','SL150NF'));
writematrix(smoothedKappa,'mean_curve_SL150NF_VisHalf.csv');
writematrix(u1,'mean_svd_SL150NF_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','VisNorm','AO50N4'));
writematrix(smoothedKappa,'mean_curve_AO50N4_VisNorm.csv');
writematrix(u1,'mean_svd_AO50N4_VisNorm.csv');

[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vis2x','AO50N4'));
writematrix(smoothedKappa,'mean_curve_AO50N4_Vis2x.csv');
writematrix(u1,'mean_svd_AO50N4_Vis2x.csv');

[u,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vish','AO50N4'));
writematrix(smoothedKappa,'mean_curve_AO50N4_VisHalf.csv');
writematrix(u1,'mean_svd_AO50N4_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','VisNorm','AO150N4'));
writematrix(smoothedKappa,'mean_curve_AO150N4_VisNorm.csv');
writematrix(u1,'mean_svd_AO150N4_VisNorm.csv');

[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vis2x','AO150N4'));
writematrix(smoothedKappa,'mean_curve_AO150N4_Vis2x.csv');
writematrix(u1,'mean_svd_AO150N4_Vis2x.csv');

[u,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vish','AO150N4'));
writematrix(smoothedKappa,'mean_curve_AO150N4_VisHalf.csv');
writematrix(u1,'mean_svd_AO150N4_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','VisNorm','SL50N4'));
writematrix(smoothedKappa,'mean_curve_SL50N4_VisNorm.csv');
writematrix(u1,'mean_svd_SL50N4_VisNorm.csv');

[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vis2x','SL50N4'));
writematrix(smoothedKappa,'mean_curve_SL50N4_Vis2x.csv');
writematrix(u1,'mean_svd_SL50N4_Vis2x.csv');

[u,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vish','SL50N4'));
writematrix(smoothedKappa,'mean_curve_SL50N4_VisHalf.csv');
writematrix(u1,'mean_svd_SL50N4_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','VisNorm','SL150N4'));
writematrix(smoothedKappa,'mean_curve_SL150N4_VisNorm.csv');
writematrix(u1,'mean_svd_SL150N4_VisNorm.csv');

[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vis2x','SL150N4'));
writematrix(smoothedKappa,'mean_curve_SL150N4_Vis2x.csv');
writematrix(u1,'mean_svd_SL150N4_Vis2x.csv');

[u,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vish','SL150N4'));
writematrix(smoothedKappa,'mean_curve_SL150N4_VisHalf.csv');
writematrix(u1,'mean_svd_SL150N4_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','VisNorm','SL50N4x10'));
writematrix(smoothedKappa,'mean_curve_SL50N4x10_VisNorm.csv');
writematrix(u1,'mean_svd_SL50N4x10_VisNorm.csv');

[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vis2x','SL50N4x10'));
writematrix(smoothedKappa,'mean_curve_SL50N4x10_Vis2x.csv');
writematrix(u1,'mean_svd_SL50N4x10_Vis2x.csv');

[u,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vish','SL50N4x10'));
writematrix(smoothedKappa,'mean_curve_SL50N4x10_VisHalf.csv');
writematrix(u1,'mean_svd_SL50N4x10_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','VisNorm','SL150N4x10'));
writematrix(smoothedKappa,'mean_curve_SL150N4x10_VisNorm.csv');
writematrix(u1,'mean_svd_SL150N4x10_VisNorm.csv');

[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vis2x','SL150N4x10'));
writematrix(smoothedKappa,'mean_curve_SL150N4x10_Vis2x.csv');
writematrix(u1,'mean_svd_SL150N4x10_Vis2x.csv');

[u,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vish','SL150N4x10'));
writematrix(smoothedKappa,'mean_curve_SL150N4x10_VisHalf.csv');
writematrix(u1,'mean_svd_SL150N4x10_VisHalf.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','VisNorm','HM0NSAR2'));
writematrix(smoothedKappa,'mean_curve_HM0NSAR2_VisNorm.csv');
writematrix(u1,'mean_svd_HM0NSAR2_VisNorm.csv');

[u1,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vis2x','HM0NSAR2'));
writematrix(smoothedKappa,'mean_curve_HM0NSAR2_Vis2x.csv');
writematrix(u1,'mean_svd_HM0NSAR2_Vis2x.csv');

[u,E1,V1,kappa,smoothedKappa] = PCA_curvemean_fn(fullfile('./','Vish','HM0NSAR2'));
writematrix(smoothedKappa,'mean_curve_HM0NSAR2_VisHalf.csv');
writematrix(u1,'mean_svd_HM0NSAR2_VisHalf.csv');
