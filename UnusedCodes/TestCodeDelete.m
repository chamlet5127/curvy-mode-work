% Input: curvature data matrix (321 x 600)
curvature_data = rand(321, 600); % Example data, replace with actual curvature data
[m,n]=size(curvature_data);
% Calculate the analytic signal using the Hilbert transform in the spatial domain
smoothed_curvature_data = smoothdata(curvature_data, 1, 'movmean', 5); % Adjust the window size as needed
analytic_signal_spatial = hilbert(curvature_data,m);

% Calculate the instantaneous phase in the spatial domain
inst_phase_spatial = unwrap(angle(analytic_signal_spatial), m);

% Calculate the local wavelength (spatial derivative of phase)
dx = 4 * pi / 320; % spatial step size
dphi_dx = diff(inst_phase_spatial, 1, 1) / dx;
local_wavelength = 2 * pi ./ dphi_dx;

% Calculate the analytic signal using the Hilbert transform in the temporal domain
analytic_signal_temporal = hilbert(curvature_data', n);

% Calculate the instantaneous phase in the temporal domain
inst_phase_temporal = unwrap(angle(analytic_signal_temporal), n)';

% Calculate the instantaneous frequency (temporal derivative of phase)
dt = 15 / 599; % temporal step size
dphi_dt = diff(inst_phase_temporal, 1, 2) / dt;
inst_frequency = 1 / (2 * pi) * dphi_dt;

% Calculate the wave speed (wavelength * frequency)
wave_speed = local_wavelength(:, 1:end-1) .* inst_frequency(1:end-1, :);

% Plot results (optional)
figure;
subplot(3,1,1);
plot(local_wavelength);
title('Local Wavelength');
colorbar;

subplot(3,1,2);
plot(inst_frequency);
title('Instantaneous Frequency');
colorbar;

subplot(3,1,3);
plot(wave_speed);
title('Wave Speed');
colorbar;
