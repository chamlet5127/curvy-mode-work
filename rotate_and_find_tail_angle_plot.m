function [x_rot, y_rot, theta_tail_rad] = rotate_and_find_tail_angle_plot(x, y, x_c, y_c, d_x, d_y)
% % function [x_rot, y_rot, theta_tail_rad] = rotate_and_find_tail_angle(x, y, x_c, y_c, d_x, d_y)
    % Function to rotate body coordinates for a single frame and compute the tail angle
    % Inputs:
    %   x, y   - 321x1 vectors of body positions (single frame)
    %   x_c, y_c - Center of mass position (single value)
    %   d_x, d_y - Principal axis components (from SVD)
    % Outputs:
    %   x_rot, y_rot - Rotated body coordinates (321x1 vectors)
    %   theta_tail_rad - Tail angle between the rotated tail direction and the principal axis (radians)

    % Step 1: Compute rotation angle to align principal axis with x-axis
    theta = atan2(d_y, d_x); % Angle in radians

    % Step 2: Create rotation matrix
    R = [cos(-theta), -sin(-theta); sin(-theta), cos(-theta)];

    % Step 3: Translate body to the origin before rotating
    x_shifted = x - x_c;
    y_shifted = y - y_c;

    % Step 4: Apply rotation
    rotated_coords = R * [x_shifted'; y_shifted'];
    x_rot = rotated_coords(1, :)' + x_c;
    y_rot = rotated_coords(2, :)' + y_c;

    % Step 5: Extract last 10 points **after rotation** (tail region)
    n_tail = 10;
    tail_x = x_rot(end-n_tail+1:end);
    tail_y = y_rot(end-n_tail+1:end);

    % Step 6: Compute best-fit line through the **rotated** tail points
    p = polyfit(tail_x, tail_y, 1); % Fit line y = p(1) * x + p(2)
    tail_slope = p(1);

    % Compute tail vector direction **in the rotated frame**
    dx_tail = 1 / sqrt(1 + tail_slope^2); % Normalize x-component
    dy_tail = tail_slope * dx_tail;       % Normalize y-component
    V_tail = [dx_tail; dy_tail];          % Tail unit vector in rotated frame

    % Step 7: Compute angle between **rotated tail vector** and principal axis
    V1_corrected = [1; 0]; % After rotation, principal axis is aligned with x-axis
    theta_tail_rad = acos(dot(V_tail, V1_corrected)); % Angle in radians

    % Step 8: Plot results
    clf; hold on;

    % Plot body
    plot(x, y, 'bo-', 'LineWidth', 2); % Original shape
    plot(x_rot, y_rot, 'go-', 'LineWidth', 2); % Rotated shape

    % Plot center of mass
    scatter(x_c, y_c, 50, 'r', 'filled');

    % Plot principal axis (now aligned with x-axis)
    quiver(x_c, y_c, 0.3, 0, 'k', 'LineWidth', 3);

    % Plot best-fit line through **rotated** tail
    x_fit = linspace(min(tail_x), max(tail_x), 50);
    y_fit = polyval(p, x_fit);
    plot(x_fit, y_fit, 'm--', 'LineWidth', 2); % Best-fit tail line

    % Plot tail direction vector from center of mass **in rotated frame**
    quiver(x_c, y_c, dx_tail * 0.3, dy_tail * 0.3, 'b', 'LineWidth', 3);

    % Step 9: Display angle information on the graph (degrees only)
    text(x_c, y_c - 0.05, sprintf('\\theta_{tail} = %.2f°', rad2deg(theta_tail_rad)), ...
         'FontSize', 12, 'FontWeight', 'bold');

    % Labels and legend
    title('Body Alignment and Tail Direction (Rotated)');
    xlabel('X Position');
    ylabel('Y Position');
    axis equal;
    grid on;
    legend('Original Body', 'Rotated Body', 'Center of Mass', ...
           'Principal Axis', 'Tail Fit Line', 'Tail Direction Vector');

    hold off;
    pause(0.1)
end
