% read in the primary access from the svd on the curvature

npt=321;
nlines=4;
allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
dirnames = ["VP5","V1","V2","V10"];


figure(1)
tiledlayout(length(dirnames),length(allfiles))



figure(1)
tiledlayout(length(dirnames),length(allfiles))

for i = 1:length(dirnames)
    for j = 1:length(allfiles)
        my_file=allfiles(j);

        file_name=fullfile('./',dirnames(i),my_file);
        XY = dlmread(file_name); %look at changing to readmatrix
        [m,n]=size(XY);
        nfr = m/(npt*4);
        XY = dlmread(file_name);

        x_vals = reshape(XY(:,1),4*npt,nfr);
        y_vals = reshape(XY(:,2),4*npt,nfr);

        xm = x_vals(1:npt,:);
        xn = x_vals(npt+1:2*npt,:);
        xl = x_vals(2*npt+1:3*npt,:);
        xr = x_vals(3*npt+1:4*npt,:);

        ym = y_vals(1:npt,:);
        yn = y_vals(npt+1:2*npt,:);
        yl = y_vals(2*npt+1:3*npt,:);
        yr = y_vals(3*npt+1:4*npt,:);

        ends_of_tail = yn(end-4:end,:);

        writematrix(z,sprintf('Excursions/tailend_%s_%s.csv',dirnames(i),my_file));

    end
end