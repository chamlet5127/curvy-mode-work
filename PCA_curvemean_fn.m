function [u,E,V,smoothedKappa,meanKappa] = PCA_curvemean_fn(file_name)
% % [filepath,name,ext] = fileparts(file_name);

XY = readmatrix(file_name,"FileType","text");
npt=321;
[m]=size(XY,1);
nfr = m/(npt*4);

x_vals = reshape(XY(:,1),4*npt,nfr);
y_vals = reshape(XY(:,2),4*npt,nfr);

xn = x_vals(npt+1:2*npt,:);
yn = y_vals(npt+1:2*npt,:);
kappa_val = zeros(npt,nfr);
% % kappa_val = kappa_val(50:end,:);
smoothedKappa = zeros(size(kappa_val));

% Smoothing code found on mathworks site
for j = 1:nfr

    kappa_val(:,j)=calculateCurvature([xn(:,j) yn(:,j)]);
    n = 1; % Order of the filter
    % Normalized cutoff frequency (between 0 and 1, where 1 corresponds to half the sampling rate)
    Wn = 0.1; 
    [b, a] = butter(n, Wn, 'low'); % Design the filter

    % Apply the filter to the curvature
    smoothedKappa(:,j) = filtfilt(b, a, kappa_val(:,j));

end
meanKappa = mean(smoothedKappa,2);
smoothedKappa1=smoothedKappa-meanKappa;
[u,E,V]=svd(smoothedKappa1);

end

