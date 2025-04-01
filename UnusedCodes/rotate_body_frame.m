function [x_rot, y_rot, theta_tail] = rotate_body_frame(x, y, x_c, y_c, d_x, d_y)
    % Function to rotate body coordinates for a single frame, compute tail direction, and calculate angle
    % Inputs:
    %   x, y   - 321x1 vectors of body positions (single frame)
    %   x_c, y_c - Center of mass position (single value)
    %   d_x, d_y - Principal axis components (from SVD)
    % Outputs:
    %   x_rot, y_rot - Rotated body coordinates (321x1 vectors)
    %   theta_tail - Angle between the tail direction and the principal axis (degrees)

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

    % Step 5: Extract last 10 points (tail region)
    n_tail = 10;
    tail_x = x_rot(end-n_tail+1:end);
    tail_y = y_rot(end-n_tail+1:end);

    % Step 6: Compute best-fit line through tail points
    p = polyfit(tail_x, tail_y, 1); % Fit line y = p(1) * x + p(2)
    tail_slope = p(1);

    % Compute tail vector direction
    dx_tail = 1 / sqrt(1 + tail_slope^2); % Normalize x-component
    dy_tail = tail_slope * dx_tail;       % Normalize y-component
    V_tail = [dx_tail; dy_tail];          % Tail unit vector

    % Step 7: Compute angle between principal axis and tail vector
    V1_corrected = [d_x; d_y]; % Principal axis vector
    theta_tail = acosd(dot(V_tail, V1_corrected)); % Angle in degrees

    % Step 8: Plot results
    clf; hold on;

    % Plot body
    plot(x, y, 'bo-', 'LineWidth', 2); % Original shape
    plot(x_rot, y_rot, 'go-', 'LineWidth', 2); % Rotated shape

    % Plot center of mass
    scatter(x_c, y_c, 50, 'r', 'filled');

    % Plot principal axis
    quiver(x_c, y_c, d_x * 0.3, d_y * 0.3, 'k', 'LineWidth', 3);

    % Plot best-fit line through tail
    x_fit = linspace(min(tail_x), max(tail_x), 50);
    y_fit = polyval(p, x_fit);
    plot(x_fit, y_fit, 'm--', 'LineWidth', 2); % Best-fit tail line

    % Plot tail direction vector from center of mass
    quiver(x_c, y_c, dx_tail * 0.3, dy_tail * 0.3, 'b', 'LineWidth', 3);

    % Step 9: Display angle information on the graph
    text(x_c, y_c - 0.05, sprintf('\\theta_{tail} = %.2f°', theta_tail), 'FontSize', 12, 'FontWeight', 'bold');

    % Labels and legend
    title('Body Alignment and Tail Direction');
    xlabel('X Position');
    ylabel('Y Position');
    axis equal;
    grid on;
    legend('Original Body', 'Rotated Body', 'Center of Mass', ...
           'Principal Axis', 'Tail Fit Line', 'Tail Direction Vector');

    hold off;
    pause(0.1)
end
