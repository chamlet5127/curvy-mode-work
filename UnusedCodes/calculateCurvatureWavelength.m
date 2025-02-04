function wavelength = calculateCurvatureWavelength(x, y)
    % Takes in (x,y) coordinates of a 2D curve and outputs the curvature
    % wavelength
    % Check if input vectors are the same length
    if length(x) ~= length(y)
        error('x and y must be the same length');
    end

    % Calculate the arc length along the centerline
    arc_length = cumsum([0; sqrt(diff(x).^2 + diff(y).^2)]);

    % Calculate the first and second derivatives of x and y with respect to arc length
    dx = gradient(x) ./ gradient(arc_length);
    dy = gradient(y) ./ gradient(arc_length);
    ddx = gradient(dx) ./ gradient(arc_length);
    ddy = gradient(dy) ./ gradient(arc_length);

    % Calculate the curvature kappa
    kappa = abs(dx .* ddy - dy .* ddx) ./ (dx.^2 + dy.^2).^(3/2);

    % Find the peaks and troughs of the curvature
    [~, peak_locs] = findpeaks(kappa);
    [~, trough_locs] = findpeaks(-kappa);

    % Combine peak and trough locations
    all_locs = sort([peak_locs; trough_locs]);

    % Calculate distances between consecutive peaks and troughs
    if length(all_locs) < 2
        error('Not enough peaks and troughs to calculate wavelength');
    end
    
    distances = diff(arc_length(all_locs));
    
    % Calculate the average wavelength
    wavelength = mean(distances);
end