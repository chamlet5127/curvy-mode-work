function [mode1,mode2,z] = PCA_fn(file_name)

nfr=600;
npt=321;
nlines=4;

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

for j = 1:nfr

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
end