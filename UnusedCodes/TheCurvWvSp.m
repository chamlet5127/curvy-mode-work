% Example curvature data (replace with actual data)
n_points = 320; % Number of spatial points
n_time_steps = 600; % Number of time steps

% Generate example curvature data
% Replace this with actual curvature data matrix of size (n_time_steps x n_points)
curvature = sin(2 * pi * (1:n_points) / 40)' * sin(2 * pi * (1:n_time_steps) / 100);
[m,n]=size(curvature);
% Apply the Hilbert transform along the time dimension for a given spatial point
analytic_signal = hilbert(curvature, n);
instantaneous_phase = unwrap(angle(analytic_signal), [], 2);

% Compute the instantaneous frequency
delta_t = 1; % Assuming time steps are equally spaced with unit interval
instantaneous_frequency = diff(instantaneous_phase, 1, 2) / (2 * pi * delta_t);

% Calculate the mean frequency and corresponding wavelength for each spatial point
mean_frequency = mean(instantaneous_frequency, 2);
wavelength = 1 ./ mean_frequency;

% Assume delta_x is the spatial distance between successive points
delta_x = 1;  % replace with actual distance if known
wave_speed = wavelength .* mean_frequency * delta_x / delta_t;

% Plot the results for a single spatial point (e.g., the first one)
figure;

subplot(3, 1, 1);
plot(1:n_time_steps, curvature(1, :));
title('Curvature Data (First Spatial Point)');
xlabel('Time Step');
ylabel('Curvature');

subplot(3, 1, 2);
plot(1:n_time_steps, instantaneous_phase(1, :));
title('Instantaneous Phase (First Spatial Point)');
xlabel('Time Step');
ylabel('Phase (radians)');

subplot(3, 1, 3);
plot(1:(n_time_steps-1), instantaneous_frequency(1, :));
title('Instantaneous Frequency (First Spatial Point)');
xlabel('Time Step');
ylabel('Frequency (Hz)');

% Display the results for the first spatial point
disp(['Mean Frequency: ', num2str(mean_frequency(1)), ' Hz']);
disp(['Wavelength: ', num2str(wavelength(1)), ' units']);
disp(['Wave Speed: ', num2str(wave_speed(1)), ' units/second']);