function [x_rot, y_rot, theta_tail_rad, vertical_dist, d_x_updated, d_y_updated, dx_tail_updated, dy_tail_updated] = rotate_and_find_tail_angle(x, y, x_c, y_c, d_x, d_y, prev_d_x, prev_d_y, prev_dx_tail, prev_dy_tail)
    % Function to rotate body coordinates for a single frame and compute the signed tail angle,
    % and calculate the vertical distance from the principal axis.
    % Inputs:
    %   x, y   - 321x1 vectors of body positions (single frame)
    %   x_c, y_c - Center of mass position (single value)
    %   d_x, d_y - Principal axis components (from SVD) for current frame
    %   prev_d_x, prev_d_y - Principal axis from the previous frame (for flip checking)
    %   prev_dx_tail, prev_dy_tail - Previous tail vector direction (to enforce consistency)
    % Outputs:
    %   x_rot, y_rot - Rotated body coordinates (321x1 vectors)
    %   theta_tail_rad - Signed tail angle (radians)
    %   vertical_dist - Vertical distance of last tail point from principal axis (meters)
    %   d_x_updated, d_y_updated - Corrected principal axis for next frame comparison
    %   dx_tail_updated, dy_tail_updated - Consistently oriented tail vector for next frame

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

    % Step 5: Check if the Principal Axis has Reversed
    d_x_updated = d_x;
    d_y_updated = d_y;
    if exist('prev_d_x', 'var') && exist('prev_d_y', 'var')
        if sign(d_x * prev_d_x + d_y * prev_d_y) < 0
            % Principal axis flipped: Reverse direction
            d_x_updated = -d_x;
            d_y_updated = -d_y;
        end
    end

    % Step 6: Extract last 10 points **after rotation** (tail region)
    n_tail = 10;
    tail_x = x_rot(end-n_tail+1:end);
    tail_y = y_rot(end-n_tail+1:end);

    % Step 7: Compute Tail Vector Directly (Avoid Slope Instability)
    dx_tail = tail_x(end) - tail_x(1);
    dy_tail = tail_y(end) - tail_y(1);
    tail_norm = sqrt(dx_tail^2 + dy_tail^2);
    dx_tail = dx_tail / tail_norm;
    dy_tail = dy_tail / tail_norm;

    % Step 8: Ensure Tail Vector Consistency Across Frames
    dx_tail_updated = dx_tail;
    dy_tail_updated = dy_tail;
    if exist('prev_dx_tail', 'var') && exist('prev_dy_tail', 'var')
        if sign(dx_tail * prev_dx_tail + dy_tail * prev_dy_tail) < 0
            dx_tail_updated = -dx_tail;
            dy_tail_updated = -dy_tail;
        end
    end

    % Step 9: Compute **signed** angle using `atan2d`
    dot_product = dot([dx_tail_updated, dy_tail_updated], [1, 0]); % Compare against x-axis
    cross_product_z = dy_tail_updated; % Cross product in 2D plane

    theta_tail_deg = atan2d(cross_product_z, dot_product);
    theta_tail_rad = deg2rad(theta_tail_deg); % Convert to radians

    % Step 10: Compute vertical distance from last tail point to principal axis
    vertical_dist = y_rot(end) - y_c; % Keep sign to track above/below principal axis

    % % % Step 11: Plot results
    % % clf; hold on;
    % % 
    % % % Plot body
    % % plot(x, y, 'bo-', 'LineWidth', 2); % Original shape
    % % plot(x_rot, y_rot, 'go-', 'LineWidth', 2); % Rotated shape
    % % 
    % % % Plot center of mass
    % % scatter(x_c, y_c, 50, 'r', 'filled');
    % % 
    % % % Plot principal axis (ensured consistent direction)
    % % quiver(x_c, y_c, 0.3, 0, 'k', 'LineWidth', 3, 'MaxHeadSize', 2);
    % % 
    % % % Plot tail direction vector
    % % quiver(x_c, y_c, dx_tail_updated * 0.3, dy_tail_updated * 0.3, 'b', 'LineWidth', 3, 'MaxHeadSize', 2);
    % % 
    % % % Plot best-fit line through **rotated** tail
    % % x_fit = linspace(min(tail_x), max(tail_x), 50);
    % % y_fit = polyval(polyfit(tail_x, tail_y, 1), x_fit);
    % % plot(x_fit, y_fit, 'm--', 'LineWidth', 2); % Best-fit tail line
    % % 
    % % % Step 12: Display angle near center of mass, vertical distance near tail
    % % text(x_c, y_c - 0.05, sprintf('\\theta_{tail} = %.2f°', theta_tail_deg), ...
    % %      'FontSize', 12, 'FontWeight', 'bold');
    % % 
    % % % Display vertical distance near the last tail point
    % % text(x_rot(end), y_rot(end) + 0.02, sprintf('Dist = %.3f m', abs(vertical_dist)), ...
    % %      'FontSize', 12, 'FontWeight', 'bold', 'Color', 'm', 'HorizontalAlignment', 'center');
    % % 
    % % % Labels and legend
    % % title('Body Alignment and Tail Direction (Rotated)');
    % % xlabel('X Position');
    % % ylabel('Y Position');
    % % axis equal;
    % % grid on;
    % % legend('Original Body', 'Rotated Body', 'Center of Mass', ...
    % %        'Principal Axis', 'Tail Fit Line', 'Tail Direction Vector');
    % % 
    % % hold off;
end
