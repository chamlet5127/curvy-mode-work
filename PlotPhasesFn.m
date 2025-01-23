function PlotPhasesFn(my_file,rws,clmns,idx)


full_file = ['./' my_file];
cd(full_file)
subplot(rws,clmns,idx)

A=dlmread('fort.55554');
A1=reshape(A(:,2),319,600);
plot(0.025*(1:600),(A1(50,:)),'k-')
hold on
plot(0.025*(1:600),(A1(170,:)),'r:')

cklbl = mod(idx,clmns);
% % cklbl = idx;
switch cklbl
    case 1
        mylabel=['base'];
                        axis([0 16 -5 20])
% %         axis([0 16 -0.1 1.1])
    case 2
        mylabel=['passive'];
                        axis([0 16 -5 20])
% %         axis([0 16 -0.1 1.1])
    case 3
        mylabel=['Mag 4x'];
                        axis([0 16 -5 20])
% %         axis([0 16 -0.1 1.1])
    case 4
        mylabel=['Mag 10x'];
                        axis([0 16 -5 20])
% %         axis([0 16 -0.1 1.1])
    case 5
        mylabel=['Mag/Dir 4x'];
                        axis([0 16 -5 200])
% %         axis([0 16 -0.1 1.1])
    case 0
        mylabel=['Mag/Dir 10x'];
                        axis([0 16 -5 200])
% %         axis([0 16 -0.1 1.1])
end
xlabel(mylabel)
ylabel('phase')


% % title('below cut')
cd ..



















