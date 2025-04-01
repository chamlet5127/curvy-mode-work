clear; clc; close all;

% --- Generate Synthetic Body Data ---
N = 321; % Number of body points
L = 1.0; % Total body length in meters
x = linspace(0, L, N)'; % Body points along x-axis

% Generate a sinusoidal undulation for y-coordinates
amplitude = 0.1; % Wave amplitude
wavelength = 0.5; % Wavelength of the wave
y = amplitude * sin(2 * pi * x / wavelength); % Simulated wave

% Define Principal Axis from SVD (Synthetic Example)
theta_principal = 30; % Assume principal axis is at 30 degrees
d_x = cosd(theta_principal);
d_y = sind(theta_principal);

% Define Center of Mass (Approximate Midpoint)
x_c = mean(x);
y_c = mean(y);

% Number of points near the tail (tail is at x = 0)
n = 10; % Adjust to test different numbers of tail points

% --- Compute the Tail Angle ---
theta_tail = compute_tail_angle_2D_2(x, y, d_x, d_y, x_c, y_c, n);

% --- Plot Results ---
figure;
hold on;
plot(x, y, 'b-', 'LineWidth', 2); % Plot body midline
scatter(x(1:n), y(1:n), 50, 'r', 'filled'); % Highlight tail points
quiver(x_c, y_c, d_x*0.3, d_y*0.3, 'k', 'LineWidth', 3); % Principal axis
title(sprintf('Tail Angle: %.2f degrees', theta_tail));
xlabel('X Position (m)');
ylabel('Y Position (m)');
axis equal;
grid on;
legend('Body Midline', 'Tail Points', 'Principal Axis');
