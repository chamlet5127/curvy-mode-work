close all
clear all
clc

% Standard plot stuff remove/change as needed
set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',20) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');

% % figure(1)
% % set(1, 'Position', [0 0 0.9*screen_size(3) 0.6*screen_size(4) ] );

nlines=4;
% % allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
% % dirnames = ["VP5","V1","V2","V10"];
n_points = 321; % Number of spatial points
n_time_steps = 600; % Number of time steps

% Generate example curvature data
% Replace this with actual curvature data matrix of size (n_time_steps x n_points)
curvature = sin(2 * pi * (1:n_points) / 40)' * sin(2 * pi * (1:n_time_steps) / 100);
% Test case to get code working
allfiles= ["HM0NSAR2"];
dirnames = ["V1"];
tiledlayout('flow')
start_seg = 40;   % cut off the head to remove any kinks
start_time = 120;  % cut off the first cycle to allow the body to shape up
end_time=600;
for k = 1:length(dirnames)   % Cycle through viscosity types

    for j = 1:length(allfiles)  % Cycle through injury types

        % read in curvature (remember this is SMOOTHED with a filter)
        kappa_in=curvature;
        % % kappa_in = readmatrix(sprintf('kappa_%s_%s.csv',dirnames(k),allfiles(j)));
        % % kappa_in = kappa_in(start_seg:end,start_time:end_time);
        % take the hilbert transform -- matlab returns u1 + iH{u1}

        % Calculate Hilbert transform in spatial domain
        [m,n]=size(kappa_in);
        hilbert_spatial = hilbert(kappa_in, m);


        % Calculate phi in the spatial direction
        phi_spatial = unwrap(angle(hilbert_spatial), m);

        % Calculate the wavelength (spatial derivative of phi)
        dx = 4 * pi / 320; % spatial step
        dphi_dx = diff(phi_spatial, 1, 1) / dx;
        wvlng = 2 * pi ./ dphi_dx;

        % Calculate Hilbert transform in the time direction
        hilbert_temporal = hilbert(kappa_in', n);

        % Calculate the instantaneous phase in the temporal domain
        phi_temporal = unwrap(angle(hilbert_temporal), n)';

        % Calculate the instantaneous frequency (time derivative of phi)
        dt = 15 / 600; % time step
        dphi_dt = diff(phi_temporal, 1, 2) / dt;
        my_frequency = 1 / (2 * pi) * dphi_dt;

        % Calculate the wave speed (wavelength * frequency)
        wave_speed = wvlng(:, 1:end-1) .* my_frequency(1:end-1, :);
    end

end



% Plot results (optional)
figure;
nexttile
plot(mean(wvlng,1))
% imagesc(local_wavelength);
title('Wavelength');

nexttile
% % imagesc(inst_frequency);
plot(mean(my_frequency,1))
title('Frequency');

nexttile
plot(mean(wave_speed,1));
title('Wave Speed');

nexttile
plot(mean(wvlng,2))
% imagesc(local_wavelength);
title('Wavelength');

nexttile
% % imagesc(inst_frequency);
plot(mean(my_frequency,2))
title('Frequency');

nexttile
plot(mean(wave_speed,2));
title('Wave Speed');



