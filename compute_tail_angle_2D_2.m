function theta_tail = compute_tail_angle_2D_2(x, y, d_x, d_y, x_c, y_c, n)
% % function theta_tail = compute_tail_angle(x, y, d_x, d_y, x_c, y_c, n)
    % Inputs:
    %   x, y   - 321x1 vectors of body positions
    %   d_x, d_y - Principal axis unit vector components (from SVD)
    %   x_c, y_c - Center of mass position
    %   n      - Number of points to use near the tail (n < 321)
    % Output:
    %   theta_tail - Tail angle relative to the correctly oriented principal axis (degrees)

    % Step 1: Compute rotation angle to align principal axis with x-axis
    theta = atan2(d_y, d_x); % Angle in radians

    % Step 2: Create rotation matrix
    R = [cos(-theta), -sin(-theta); sin(-theta), cos(-theta)];

    % Step 3: Translate body to the origin before rotating
    x_shifted = x - x_c;
    y_shifted = y - y_c;

    % Step 4: Apply rotation to align the body with the x-axis
    rotated_coords = R * [x_shifted'; y_shifted'];
    x_rot = rotated_coords(1, :)' + x_c;
    y_rot = rotated_coords(2, :)' + y_c;

    % Step 5: Extract tail points (first n points)
    tail_x = x_rot(1:n);
    tail_y = y_rot(1:n);

    % Step 6: Compute tail direction (linear fit)
    p = polyfit(tail_x, tail_y, 1); % Fit a line: y = p(1)*x + p(2)
    tail_slope = p(1);

    % Convert slope to a unit vector (dx_tail, dy_tail)
    dx_tail = 1 / sqrt(1 + tail_slope^2); % Normalize x-component
    dy_tail = tail_slope * dx_tail;       % Normalize y-component
    V_tail = [dx_tail; dy_tail];          % Tail unit vector

    % Step 7: Compute angle with the correctly aligned principal axis (which is now [1,0])
    V1_corrected = [1; 0]; % Principal axis is now aligned with x-axis

    % Step 8: Compute angle using dot product
    theta_tail = acosd(dot(V_tail, V1_corrected)); % Angle with aligned principal axis

    % Display result
    fprintf('Tail Angle with Correctly Oriented Principal Axis: %.2f degrees\n', theta_tail);
end

