function [u,E,V,kappa_val,smoothedKappa] = PCA_curve_fn(file_name)
[filepath,name,ext] = fileparts(file_name);
nfr=600;
npt=321;
nlines=4;

XY = dlmread(file_name);

x_vals = reshape(XY(:,1),4*npt,nfr);
y_vals = reshape(XY(:,2),4*npt,nfr);

xm = x_vals(1:npt,:);
xn = x_vals(npt+1:2*npt,:);  % Need this one
xl = x_vals(2*npt+1:3*npt,:);
xr = x_vals(3*npt+1:4*npt,:);

ym = y_vals(1:npt,:);
yn = y_vals(npt+1:2*npt,:);   % Need this one
yl = y_vals(2*npt+1:3*npt,:);
yr = y_vals(3*npt+1:4*npt,:);

width = sqrt((xl - xr).^2 + (yl - yr).^2);

sn = repmat(sqrt((xn(1,:)-xm(1,:)).^2 + (yn(1,:)-ym(1,:)).^2),[npt 1]) + ...
    [zeros(1,nfr); cumsum(sqrt(diff(xn).^2 + diff(yn).^2))];
len = sum(sqrt(diff(xm).^2 + diff(ym).^2));

sn = [zeros(1,nfr); sn(1:end-1,:); len];

for k = 1:nfr
    area(k) = trapz(sn(:,k),[0; width(1:end-1,k); 0]);
end

comx = zeros(1,nfr);
comy = zeros(1,nfr);
for k = 1:nfr
    comx(k) = trapz(sn(:,k),...
        [0; xn(1:end-1,k).*width(1:end-1,k); 0] ./ area(k));
    comy(k) = trapz(sn(:,k),...
        [0; yn(1:end-1,k).*width(1:end-1,k); 0] ./ area(k));
end

for k=1:nfr
    [x_new,y_new]= rotate_Lamprey(xn,yn,comx,comy,nfr);
end
% % keyboard

for j = 1:nfr

    kappa_val(:,j)=calculateCurvature([x_new(:,j) y_new(:,j)]);


    % % windowSize = 10; % Adjust the window size as needed
    % % b = (1/windowSize)*ones(1,windowSize);
    % % a = 1;
    % % smoothedKappa(:,j) = filter(b, a, kappa_val(:,j));

    n = 1; % Order of the filter
    Wn = 0.1; % Normalized cutoff frequency (between 0 and 1, where 1 corresponds to half the sampling rate)
    [b, a] = butter(n, Wn, 'low'); % Design the filter

    % Apply the filter to the curvature
    smoothedKappa(:,j) = filtfilt(b, a, kappa_val(:,j));

end
meanKappa = mean(smoothedKappa,2);
smoothedKappa=smoothedKappa-meanKappa;
[u,E,V]=svd(smoothedKappa);

% Plot the original and smoothed curvature
% % figure(2);
% % plot(kappa_val(:,j), 'b-', 'LineWidth', 1);
% % hold on;
% % plot(smoothedKappa(:,j), 'r-', 'LineWidth', 2);
% % pause(0.1)
% % legend('Original Curvature', 'Smoothed Curvature');
% % title('Curvature Smoothing');
% % xlabel('Point Index');
% % ylabel('Curvature Value');
% % grid on;
% % hold off
% % plot(kappa_val)
% % hold off
% % pause(0.1)

end

