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
start_seg = 60;   % cut off the head to remove any kinks
start_time = 120;  % cut off the first cycle to allow the body to shape up
end_time=400;
for k = 1:length(dirnames)   % Cycle through viscosity types

    for j = 1:length(allfiles)  % Cycle through injury types

        % read in curvature (remember this is SMOOTHED with a filter)
        kappa_in = readmatrix(sprintf('kappa_%s_%s.csv',dirnames(k),allfiles(j)));
        n_points = 321; % Number of spatial points
        n_time_steps = 600; % Number of time steps

        % Generate example curvature data
        % Replace this with actual curvature data matrix of size (n_time_steps x n_points)
        % kappa_in = sin(2 * pi * (1:n_points) / 40)' * sin(2 * pi * (1:n_time_steps) / 100);
        kappa_in = kappa_in(start_seg:end,start_time:end_time);
        % take the hilbert transform -- matlab returns u1 + iH{u1}

        % Calculate Hilbert transform in spatial domain
        [m,n]=size(kappa_in);


        % Assuming 'curvature' is a 320x600 matrix where rows correspond to points along the body and columns correspond to time steps

        % Step 1: Extract tail displacement (assuming last point is the tail)
        tail_displacement = kappa_in(end, :);

        % Step 2: Calculate the FFT of the tail displacement
        N = length(tail_displacement);
        Fs = 1; % Sampling frequency, assuming data points are recorded at 1 Hz
        Y = fft(tail_displacement);
        P2 = abs(Y/N);
        P1 = P2(1:N/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        f = Fs*(0:(N/2))/N;

        % Step 3: Find the frequency corresponding to the maximum peak in the FFT
        [~, idx] = max(P1);
        tail_beat_frequency = f(idx);

        % Step 4: Calculate the amplitude of the tail displacement
        tail_amplitude = (max(tail_displacement) - min(tail_displacement)) / 2;

        % Step 5: Calculate the Strouhal number
        mean_forward_velocity = 1; % Replace with actual mean forward velocity
        Strouhal_number = tail_beat_frequency * tail_amplitude / mean_forward_velocity;

        % Display results
        disp(['Tail Beat Frequency: ', num2str(tail_beat_frequency), ' Hz']);
        disp(['Tail Amplitude: ', num2str(tail_amplitude)]);
        disp(['Strouhal Number: ', num2str(Strouhal_number)]);
    end

end

% % %
% % %
% % % % Plot results (optional)
% % % figure;
% % % nexttile
% % % plot(mean(wvlng,1))
% % % % imagesc(local_wavelength);
% % % title('Wavelength');
% % %
% % % nexttile
% % % % % imagesc(inst_frequency);
% % % plot(mean(my_frequency,1))
% % % title('Frequency');
% % %
% % % nexttile
% % % plot(mean(wave_speed,1));
% % % title('Wave Speed');
% % %
% % % nexttile
% % % plot(mean(wvlng,2))
% % % % imagesc(local_wavelength);
% % % title('Wavelength');
% % %
% % % nexttile
% % % % % imagesc(inst_frequency);
% % % plot(mean(my_frequency,2))
% % % title('Frequency');
% % %
% % % nexttile
% % % plot(mean(wave_speed,2));
% % % title('Wave Speed');





% Input: curvature data matrix (321 x 600)
% % curvature_data = rand(321, 600); % Example data, replace with actual curvature data
% %
% % % Define spatial and temporal step sizes
% % dx = 4 * pi / 320; % spatial step size
% % dt = 15 / 599; % temporal step size
% %
% % % Initialize arrays to store results
% % wavelengths = zeros(1, 600);
% % frequencies = zeros(321, 1);
% % wave_speed = zeros(321, 600);
% %
% % % Calculate wavelength at each time point by identifying peaks
% % for t = 1:600
% %     [~, locs] = findpeaks(curvature_data(:, t));
% %     if length(locs) > 1
% %         % Calculate distances between consecutive peaks
% %         peak_distances = diff(locs) * dx;
% %         % Average distance between peaks is the wavelength
% %         wavelengths(t) = mean(peak_distances);
% %     else
% %         wavelengths(t) = NaN; % Not enough peaks to calculate wavelength
% %     end
% % end
% %
% % % Calculate frequency at each spatial point by identifying peaks
% % for x = 1:321
% %     [~, locs] = findpeaks(curvature_data(x, :));
% %     if length(locs) > 1
% %         % Calculate distances between consecutive peaks
% %         peak_times = diff(locs) * dt;
% %         % Average time between peaks is the period
% %         periods = mean(peak_times);
% %         % Frequency is the inverse of the period
% %         frequencies(x) = 1 / periods;
% %     else
% %         frequencies(x) = NaN; % Not enough peaks to calculate frequency
% %     end
% % end
% %
% % % Calculate wave speed as wavelength * frequency
% % for t = 1:600
% %     for x = 1:321
% %         wave_speed(x, t) = wavelengths(t) * frequencies(x);
% %     end
% % end
% %
% % % Plot results (optional)
% % figure;
% % subplot(3,1,1);
% % plot(wavelengths);
% % title('Wavelength over Time');
% % xlabel('Time Index');
% % ylabel('Wavelength (units of dx)');
% % grid on;
% %
% % subplot(3,1,2);
% % plot(frequencies);
% % title('Frequency over Space');
% % xlabel('Spatial Index');
% % ylabel('Frequency (Hz)');
% % grid on;
% %
% % subplot(3,1,3);
% % imagesc(wave_speed);
% % title('Wave Speed');
% % xlabel('Time Index');
% % ylabel('Spatial Index');
% % colorbar;


% % % Assuming 'curvature' is a 320x600 matrix where rows correspond to points along the body and columns correspond to time steps
% % 
% % % Step 1: Extract tail displacement (assuming last point is the tail)
% % tail_displacement = curvature(end, :);
% % 
% % % Step 2: Calculate the FFT of the tail displacement
% % N = length(tail_displacement);
% % Fs = 1; % Sampling frequency, assuming data points are recorded at 1 Hz
% % Y = fft(tail_displacement);
% % P2 = abs(Y/N);
% % P1 = P2(1:N/2+1);
% % P1(2:end-1) = 2*P1(2:end-1);
% % f = Fs*(0:(N/2))/N;
% % 
% % % Step 3: Find the frequency corresponding to the maximum peak in the FFT
% % [~, idx] = max(P1);
% % tail_beat_frequency = f(idx);
% % 
% % % Step 4: Calculate the amplitude of the tail displacement
% % tail_amplitude = (max(tail_displacement) - min(tail_displacement)) / 2;
% % 
% % % Step 5: Calculate the Strouhal number
% % mean_forward_velocity = 1; % Replace with actual mean forward velocity
% % Strouhal_number = tail_beat_frequency * tail_amplitude / mean_forward_velocity;
% % 
% % % Display results
% % disp(['Tail Beat Frequency: ', num2str(tail_beat_frequency), ' Hz']);
% % disp(['Tail Amplitude: ', num2str(tail_amplitude)]);
% % disp(['Strouhal Number: ', num2str(Strouhal_number)]);