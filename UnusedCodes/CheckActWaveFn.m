function CheckActWaveFn(dirname,rw,clmns,idx)

cd(dirname)

A = dlmread('fort.45');
[m,n] = size(A);

segnum = reshape(A(:,2),280,m/280);
ksim1 = reshape(A(:,3),280,m/280);
ksim2 = reshape(A(:,4),280,m/280);

[activenum,dumpnum] = size(ksim1);
screen_size = get(0, 'ScreenSize');
figure(3)
        subplot(rw,clmns,idx)
        hold on
        axis([5 6 0 350])
        %switch mod(idx,clmns)
        switch idx
            case 1
                mylabel=['base'];
            case 2
                mylabel=['passive'];
            case 3
                mylabel=['Mag 4x'];
            case 4
                mylabel=['Mag 10x'];
            case 5
                mylabel=['Mag/Dir 4x'];
            case 6
                mylabel=['Mag/Dir 10x'];
        end
                
        xlabel(mylabel)
for j = 200:240
    
    
    for i = 1:activenum
        
        ksim1(i,j);
        if ksim1(i,j) > 0.5
            plot(j*0.025,segnum(i,j),'o','MarkerSize',4,'MarkerEdgeColor','k','MarkerFaceColor','k')
            hold on
        end
        if ksim2(i,j) > 0.5
            plot(j*0.025,segnum(i,j),'o','MarkerSize',4,'MarkerEdgeColor','b','MarkerFaceColor','b')
            hold on
            
        end
        
        if ksim1(i,j) > 0.5 && ksim2(i,j) > 0.5
            plot(j*0.025,segnum(i,j),'o','MarkerSize',4,'MarkerEdgeColor',[0.4940 0.1840 0.5560],'MarkerFaceColor',[0.4940 0.1840 0.5560])
            hold on
        end
        
        
    end
    
    
    
end

cd ..
% % screen_size = get(0, 'ScreenSize');
% % set(1, 'Position', [0 0 0.4*screen_size(3) 0.5*screen_size(4) ] );
% % export_fig(['../LC50N-4'],'-png','-nocrop')