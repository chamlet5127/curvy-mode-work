% read in the primary access from the svd on the curvature

npt=321;
nlines=4;
allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
dirnames = ["VP5","V1","V2","V10"];


for i = 1:length(dirnames)
    for j = 1:length(allfiles)
        my_file=allfiles(j);

        file_name=fullfile('./',dirnames(i),my_file);
        
        tail_points = readmatrix(sprintf('Excursions/tailend_%s_%s.csv',dirnames(i),my_file));
        main_axis = readmatrix(sprintf('Excursions/Abodyaxis_%s_%s.csv',dirnames(i),my_file));
        keyboard
    end
end
    
