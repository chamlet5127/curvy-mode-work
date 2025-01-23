disp('  Calculating fluid quantities...');
samraibasedir='HM0NSAR2/viz_IB2d/'
samraidirs = getdirectorynames(fullfile(samraibasedir,'visit*'))';
nfr=600;
fr0 = 1;

saveextra = {};
N = min(length(samraidirs)-1, nfr);
for fr = fr0:N,
    fprintf('Importing %s (%d%%)...\n', samraidirs{fr+1}, round((fr+1)/nfr*100));
    [x,y,FlInterp,Fl] = importsamrai(samraidirs{fr+1},'vars',{'U_x','U_y','P','Omega'},'interpolaten',[200 200]);
    
    U{fr}=FlInterp.U_x;
    V{fr}=FlInterp.U_y;
    Omega{fr}=FlInterp.Omega;
    P{fr}=FlInterp.P;
    %V = velderivsamrai(V);


end;
