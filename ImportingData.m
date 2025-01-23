
%at the moment, we only import variables with a single component

% % pathname = '../Downloads/V2/HM0NSAR2'


% % summaryfile = fullfile(pathname,'summary.samrai');
% % subfiles = getfilenames(fullfile(pathname,'processor_cluster*.samrai'))
% % 
% % %get the patch info
% % patchext = h5compound2struct(hdf5read(summaryfile, '/extents/patch_extents'));
% % patchmap = h5compound2struct(hdf5read(summaryfile, '/extents/patch_map'));
% % 
% % npatch = length(patchext);
% % 
% % %and the variable info
% % varnames0 = hdf5read(summaryfile,'/BASIC_INFO/var_names');
% % dx = hdf5read(summaryfile,'/BASIC_INFO/dx')';
% % 
% % varncomponents = hdf5read(summaryfile,'/BASIC_INFO/var_number_components');
% % good = varncomponents == 1;
% % varnames0 = varnames0(good);

samraidirs = getdirectorynames(fullfile('HM0NSAR2/viz_IB2d/','visit*'))';
        
[x,y,V] = importsamrai(samraidirs,'vars',{'U_0','U_1'},'interpolaten',[100 50]);
flowspeed = mean(V.U_0(x < xm(1,1)-1));

