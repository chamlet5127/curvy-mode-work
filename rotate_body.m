function [x_rot, y_rot] =rotate_body(x, y, x_c, y_c, d_x, d_y)
% % function [x_rot, y_rot] = rotate_body_frame(x, y, x_c, y_c, d_x, d_y)
    % Function to rotate body coordinates for a single frame
    % Inputs:
    %   x, y   - 321x1 vectors of body positions (single frame)
    %   x_c, y_c - Center of mass position (single value)
    %   d_x, d_y - Principal axis components (from SVD)
    % Outputs:
    %   x_rot, y_rot - Rotated body coordinates (321x1 vectors)

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

    % Step 5: Update existing figure instead of creating a new one
    clf; % Clear the current figure window without opening a new one
    hold on;
    plot(x, y, 'bo-', 'LineWidth', 2); % Original shape
    plot(x_rot, y_rot, 'go-', 'LineWidth', 2); % Rotated shape
    scatter(x_c, y_c, 50, 'r', 'filled'); % Center of mass
    quiver(x_c, y_c, d_x * 0.3, d_y * 0.3, 'k', 'LineWidth', 3); % Principal axis
    
    title('Body Alignment for One Frame');
    xlabel('X Position');
    ylabel('Y Position');
    axis equal;
    grid on;
    legend('Original', 'Rotated', 'Center of Mass', 'Principal Axis');
    hold off;
    pause(0.1)

end
