% Function to calculate the wavelength of an anguilliform swimmer
function wavelength = calculateWavelength(x, y)
    % Check if input vectors are the same length
    if length(x) ~= length(y)
        error('x and y must be the same length');
    end

    % Calculate the arc length along the centerline
    arc_length = cumsum([0; sqrt(diff(x).^2 + diff(y).^2)]);
    
    % % % Fit a smooth spline to the y-coordinates as a function of arc length
    % % spline_fit = fit(arc_length, y, 'smoothingspline');
    % % 
    % % % Define a finer set of points for better accuracy
    % % fine_arc_length = linspace(min(arc_length), max(arc_length), 1000);
    % % fine_y = feval(spline_fit, fine_arc_length);

    % Find the peaks and troughs of the y-values
    [~, peak_locs] = findpeaks(y);
    [~, trough_locs] = findpeaks(-y);

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

% Example usage:
% Define the (x, y) coordinates of the centerline
