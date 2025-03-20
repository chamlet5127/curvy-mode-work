close all
clear all
clc
% This code brings in the files with curvature information and writes the
% PCA matrices. If C is the curvature matrix this writes u,E,V where
% C = uEV^T
set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',20) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');
npt=321;
nlines=4;
% % allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
% % dirnames = ["VP5","V1","V2","V10"];
allfiles= ["HM0NSAR2"]; %% ,"HM4NSAR2"%% 
dirnames = ["V1"];

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

        for t = 1:nfr

            x_c(:,t)=xn(:,t)-comx(t);
            y_c(:,t)=yn(:,t)-comy(t);

            bigX=[x_c(:,t)';y_c(:,t)'];

            [A,Sig,B]=svd(bigX);

            xp=A(1,1);
            yp=A(2,1);

            for k = 1:npt
                z(k,t)=-x_c(k,t)*yp+y_c(k,t)*xp;
            end
%             plot(1:321,z(:,t))
%             axis([0 321 -2 2])
%             pause(0.1)
        end
        writematrix(z,sprintf('Excursions/Abodyaxis_%s_%s.csv',dirnames(i),my_file));            
        writematrix(z,sprintf('Excursions/exc_%s_%s.csv',dirnames(i),my_file));
        
    end
end
