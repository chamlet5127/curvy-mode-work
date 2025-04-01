close all
clear all
clc

% walks through example of feeny paper

lamb = 1;                           % wave number
c = 1;                              % wave speed
final_time = 10.0;                   % ending time
dt = 0.01;                          % time step
n = floor(final_time/dt);
m = 100;                            % number of points
omega = c*lamb;                     % frequency

L = 2*pi                            % Length

x = linspace(0,L,m);                % discretize domain
t = linspace(0,final_time,n);

y0 = sin(lamb*(x));                 % initial position
for i = 1:length(t)
    y(:,i) = sin(lamb*(x(:)-c*t(i)));
    plot(x,y(:,1))
    hold on
    plot(x,y(:,i),'*-k')
    pause(0.01)
    hold off
end


