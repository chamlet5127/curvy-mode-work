function curvature = calculateCurvature(points)
    % Ensure that points is a Nx2 matrix where N is the number of points
    % The first column should contain x values, and the second column y values
    
    % Number of points
    N = size(points, 1);
    
    % Pre-allocate curvature array
    curvature = zeros(N-2, 1);
    
    % Calculate first derivatives
    dx = diff(points(:,1)); % Difference in x
    dy = diff(points(:,2)); % Difference in y
    
    % Calculate second derivatives
    ddx = diff(dx);
    ddy = diff(dy);
    
    % Calculate the curvature for each point, except the first and last
    for i = 1:length(ddx)
        numerator = (dx(i) * ddy(i) - dy(i) * ddx(i));
        denominator = (dx(i)^2 + dy(i)^2)^(3/2);
        curvature(i) = numerator / denominator;
    end
    
    % Handle curvature array to match points array, if needed
    % This step depends on how you want to align the curvature values with your points
    % One approach is to replicate the curvature at the ends
    curvature = [curvature(1); curvature; curvature(end)];
end