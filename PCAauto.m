close all
clear all
clc

nfr=600;
npt=321;
nsegs=321;
nlines=4;
fnamesAO50=["AO50N4","AO50NF"];
fnamesAO150=["AO150N4","AO150NF"];
fnamesSL50=["SL50N4","SL50NF","SL50N4x10"];
fnamesSL150=["SL150N4","SL150NF","SL150N4x10"];
dirnames = ["VisNorm","Vis2x","Vish"];

m = length(dirnames)
n = length(fnamesAO50)
for i=1:length(dirnames)
    % the_file = sprintf('',file_idx(i));
    for jj = 1:length(fnamesAO50)
        fullname = [dirnames(jj)];
        fn = fullfile('./',fullname,fnamesAO50(jj));
        body_dat=load(fn,'.csv');
        display(fn)
        %pause

XY = dlmread(fn);

x_vals = reshape(XY(:,1),4*npt,nfr);
y_vals = reshape(XY(:,2),4*npt,nfr);

xm = x_vals(1:nsegs,:);
xn = x_vals(nsegs+1:2*nsegs,:);
xl = x_vals(2*nsegs+1:3*nsegs,:);
xr = x_vals(3*nsegs+1:4*nsegs,:);

ym = y_vals(1:nsegs,:);
yn = y_vals(nsegs+1:2*nsegs,:);
yl = y_vals(2*nsegs+1:3*nsegs,:);
yr = y_vals(3*nsegs+1:4*nsegs,:);

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
for k = 1:nfr,
    comx(k) = trapz(sn(:,k),...
        [0; xn(1:end-1,k).*width(1:end-1,k); 0] ./ area(k));
    comy(k) = trapz(sn(:,k),...
        [0; yn(1:end-1,k).*width(1:end-1,k); 0] ./ area(k));
end

for j = 100:nfr

    x_c(:,j)=xn(:,j)-comx(j);
    y_c(:,j)=yn(:,j)-comy(j);

    bigX=[x_c(:,j)';y_c(:,j)'];

    [A,Sig,B]=svd(bigX);

    xp=A(1,1);
    yp=A(2,1);

    for k = 1:npt
        z(k,j)=-x_c(k,j)*yp+y_c(k,j)*xp;
    end

    zH(:,j)=hilbert(z(:,j));
    newz(:,j)=z(:,j)+i*zH(:,j);

    

end

R= newz*ctranspose(newz);

[V,SigR,VT]=svd(R);

mode1=V(:,1);
mode2=V(:,2);
figure(1)
subplot(m,n,i*jj)
plot(real(mode1))
hold on
plot(imag(mode1))
% % subplot(2,1,2)
% % plot(real(mode2))
% % hold on
% % plot(imag(mode2))
pause(0.1)
end

end
% % figure(1)
% % for i=1:nfr
% % plot(xn(:,i),yn(:,i),'-')
% % hold on
% % plot(comx(i),comy(i),'*')
% % axis([-70 20 5 8])
% % hold off
% % pause(0.1)
% % end