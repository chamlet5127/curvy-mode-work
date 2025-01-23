disp('  Calculating fluid quantities...');
samraibasedir='HM0NSAR2/viz_IB2d/'
samraidirs = getdirectorynames(fullfile(samraibasedir,'visit*'))';
nfr=600;
fr0 = 1;

saveextra = {};

N = min(length(samraidirs)-1, nfr);
for fr = fr0:N,
    fprintf('Importing %s (%d%%)...\n', samraidirs{fr+1}, round((fr+1)/nfr*100));
    V{fr} = importsamrai(samraidirs{fr+1},'vars',{'U_x','U_y','P','Omega'});
    V{fr} = getsamraipatchedges(V);
    V{fr} = velderivsamrai(V);


end;
