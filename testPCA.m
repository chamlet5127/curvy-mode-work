%close all
clear all 
% % clc

A = 3;
k = 1;
om = 1;
n = 50;

x = linspace(0,2*pi,n);
t = linspace(0,2*pi,100);
for i = 1:length(t)
    yform(:,i) = A*sin(k*x(:)-om*t(i));
    % % plot(x,yform(:,i))
    % % pause(0.01)
end

for j = 1:length(t)

    newCurve(:,j) = calculateCurvature([x(:) yform(:,j)]);
    % % plot(x,newCurve(:,j))
    % % pause(0.1)
end

[u sig v]= svd(yform);
[uC sigC vC] = svd(newCurve);

for j = 1:length(t)
alpha_1c(j)=newCurve(:,j)'*uC(:,1)/sqrt(n);
alpha_2c(j)=newCurve(:,j)'*uC(:,2)/sqrt(n);

alpha_1(j)=yform(:,j)'*u(:,1)/sqrt(n);
alpha_2(j)=yform(:,j)'*u(:,2)/sqrt(n);
end

for j= 1:length(t)
     % % plot(x,newCurve(:,j))
    % % hold on
    % % plot(x,alpha_1(j)*uC(:,1)+alpha_2(j)*uC(:,2))
    % % hold off
    % % % % plot(alpha_1c(j),alpha_2c(j),'*')
    % % % % hold on
    % % % % plot(alpha_1(j),alpha_2(j),'^')
    % % % % plot(-A*sin(om*j),A*cos(om*j),'o')
    % % % % hold on
    % % % % pause(0.1)

end