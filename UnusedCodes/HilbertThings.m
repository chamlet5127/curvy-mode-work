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

% Test case to get code working
allfiles= ["HM0NSAR2"];
dirnames = ["V1"];
tiledlayout('flow')
start_seg = 45;   % cut off the head to remove any kinks
start_time = 80;  % cut off the first cycle to allow the body to shape up

for k = 1:length(dirnames)   % Cycle through viscosity types

    for j = 1:length(allfiles)  % Cycle through injury types

        % read in curvature (remember this is SMOOTHED with a filter)
        kappa_in = readmatrix(sprintf('kappa_%s_%s.csv',dirnames(k),allfiles(j)));
        kappa_in = kappa_in(start_seg:end,start_time:end);
        [m,n]=size(kappa_in);
        % % smoothed_curvature_data = smoothdata(kappa_in, 'movmean', 5); % Adjust the window size as needed
        % take the hilbert transform -- matlab returns u1 + iH{u1}
        hilbert_kappa_spatial= hilbert(kappa_in,m);
        hilbert_kappa_temporal=hilbert(kappa_in,n);
        % get the amplitude and phase of the analytical signal
        amp = abs(hilbert(kappa_in));
        phi_spatial = unwrap(angle(hilbert_kappa_spatial),[],1);
        phi_temporal = unwrap(angle(hilbert_kappa_temporal),[],2);

        % get the spatial derivative to find wavelength dphi/ds

        % denominator
        % Calculate the local wavelength (spatial derivative of phase)
        dx = 4 * pi / 320; % spatial step size
        dphi_dx = diff(phi_spatial, 1, 1) / dx;
        local_wavelength = 2 * pi ./ dphi_dx;

        % Calculate the instantaneous frequency (temporal derivative of phase)
        dt = 15 / 599; % temporal step size
        dphi_dt = diff(phi_temporal, 1, 2) / dt;
        inst_frequency = 1 / (2 * pi) * dphi_dt;

        % Calculate the wave speed (wavelength * frequency)
        wave_speed = local_wavelength(:, 1:end-1) .* inst_frequency(1:end-1, :);

    end

end

% % % 
% % % nexttile
% % % plot(amp)
% % % title('amplitudes')
% % % xlabel('segment')
% % % ylabel('amp')
% % % nexttile
% % % plot(phi)
% % % title('phase')
% % % xlabel('segment')
% % % ylabel('phase')
% % % nexttile
% % % plot(wvln)
% % % title('wavelength')
% % % xlabel('segment')
% % % ylabel('wavelength')
% % % nexttile
% % % plot(freq)
% % % title('frequency')
% % % xlabel('segment')
% % % ylabel('frequency')
% % % nexttile
% % % plot(wavespeed(:,1:20:end))
% % % title('wave speed')
% % % xlabel('segment')
% % % ylabel('wave speed')
% % % % % plot(1:599,V)


% Plot results (optional)
figure;
subplot(3,1,1);
plot(local_wavelength)
% imagesc(local_wavelength);
title('Local Wavelength');
colorbar;

subplot(3,1,2);
% % imagesc(inst_frequency);
plot(inst_frequency)
title('Instantaneous Frequency');
colorbar;

subplot(3,1,3);
plot(wave_speed);
title('Wave Speed');
colorbar;

