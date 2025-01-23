function PlotPhasesFnMod(my_file,rws,clmns,idx)


full_file = ['./' my_file];
cd(full_file)
subplot(rws,clmns,idx)

A=dlmread('fort.55554');



A1=reshape(A(:,2),319,600);
hold on
% % theta = dlmread(total_file);
theta_segs = 319;
nfr = 600;   
nosc = 280;


my_time1 = reshape(A(:,1),theta_segs,nfr);
my_time = my_time1(1,:);
dt = (my_time(2)-my_time(1));

thetaL = reshape(A(:,2),theta_segs,nfr);
thetaL = thetaL(1:nosc,:);
    
thetaR = reshape(A(:,3),theta_segs,nfr);
thetaR = thetaR(1:nosc,:);
    
dthetaL_dt = (thetaL(:,2:end)-thetaL(:,1:end-1))./dt;
dthetaR_dt = (thetaR(:,2:end)-thetaR(:,1:end-1))./dt;
    
% % plot(0.025*(400:600),mod(A1(50,400:600),1),'k-')    
% % plot(0.025*(400:600),mod(A1(170,400:600),1),'r:')

plot(0.025*(400:599),dthetaL_dt(30,400:599),'k-')    
plot(0.025*(400:599),dthetaL_dt(170,400:599),'r:','LineWidth',2)


cklbl = mod(idx,clmns);
% % cklbl = idx;
switch cklbl
    case 1
        mylabel=['base'];
        % %                 axis([0 16 -5 20])
        axis([10 16 -1.5 1.5])
    case 2
        mylabel=['passive'];
        %                 axis([0 16 -5 20])
        axis([10 16 -1.5 1.5])
    case 3
        mylabel=['Mag 4x'];
        %                 axis([0 16 -5 20])
        axis([10 16 -1.5 1.5])
    case 4
        mylabel=['Mag 10x'];
        %                 axis([0 16 -5 20])
        axis([10 16 -1.5 1.5])
    case 5
        mylabel=['Mag/Dir 4x'];
        %                 axis([0 16 -5 200])
       axis([10 16 -1.5 1.5])
    case 0
        mylabel=['Mag/Dir 10x'];
        %                 axis([0 16 -5 200])
        axis([10 16 -1.5 1.5])
end
xlabel(mylabel)
ylabel('frequency')


% % title('below cut')
cd ..



















