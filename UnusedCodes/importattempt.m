 
samraibasedir='./HM0NSAR2/viz_IB2d';

        samraidirs = getdirectorynames(fullfile(samraibasedir,'visit*'))';
        
        [x,y,V] = importsamrai(samraidirs{2},'vars',{'U_0','U_1'}, ...
            'interpolaten',[100 50]);
        flowspeed = mean(V.U_0(x < xm(1,1)-1));