disp('  Calculating fluid quantities...');
% Test on the base case
samraibasedir='HM0NSAR2/viz_IB2d/'
samraidirs = getdirectorynames(fullfile(samraibasedir,'visit*'))';

% Set number of frames and framerate
nfr=600;
fr0 = 1;

% From eric's code not needed here?
saveextra = {};

% Pull out U,V (velocity components) Omega (vorticity) and P (Pressure)
% Saves as cells
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

% Old piece
% % N = min(length(samraidirs)-1, nfr);
% % for fr = fr0:N,
% %     fprintf('Importing %s (%d%%)...\n', samraidirs{fr+1}, round((fr+1)/nfr*100));
% %     V{fr} = importsamrai(samraidirs{fr+1},'vars',{'U_x','U_y','P','Omega'});
% %     V{fr} = getsamraipatchedges(V);
% %     V{fr} = velderivsamrai(V);
% % 
% % 
% % end;
