function theta_tail = compute_tail_angle_2D(x, y, x_c, y_c, d_x, d_y, num_tail_points)
    % Computes the angle between the principal axis and the swimmer's tail
    %
    % Inputs:
    %   x, y        - Arrays of 321 centerline coordinates
    %   x_c, y_c    - Center of mass coordinates
    %   d_x, d_y    - Principal axis unit direction vector from SVD
    %   num_tail_points - Number of points near the tail to use (5-7 recommended)
    %
    % Output:
    %   theta_tail - Tail angle in degrees relative to the principal axis

    % Ensure num_tail_points does not exceed array length
    num_tail_points = min(num_tail_points, length(x));
    
    % --- Step 1: Compute the Principal Axis Unit Vector ---
    principal_vector = [d_x; d_y];  
    principal_vector = principal_vector / norm(principal_vector);  % Normalize

    % --- Step 2: Compute the Tail Tangent ---
    x_tail = x(end-num_tail_points+1:end);
    y_tail = y(end-num_tail_points+1:end);

    % Compute finite difference derivative dy/dx
    dx = diff(x_tail);
    dy = diff(y_tail);

    % Compute the average tail tangent vector
    avg_dx = mean(dx);
    avg_dy = mean(dy);
    tail_vector = [avg_dx; avg_dy];  
    tail_vector = tail_vector / norm(tail_vector);  % Normalize

    % --- Step 3: Compute the Angle Between Tail and Principal Axis ---
    dot_product = dot(principal_vector, tail_vector);
    theta_tail = acos(dot_product);  % Angle in radians

    % Convert to degrees
    theta_tail_deg = rad2deg(theta_tail);

    % Display result
    % % fprintf('Tail angle relative to principal axis: %.2f degrees\n', theta_tail_deg);

    % Return angle
    theta_tail = theta_tail_deg;
end
