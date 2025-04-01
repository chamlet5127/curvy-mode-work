close all
clear all
clc
% This code brings in the files with curvature information and writes the
% PCA matrices. If C is the curvature matrix this writes u,E,V where
% C = uEV^T
set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',20) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');
npt=321;
nlines=4;
allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
dirnames = ["V1","V2","V10"];
% % dirnames = ["VP5","V1","V2","V10"];
% % allfiles= ["HM0NSAR2"]; %% ,"HM4NSAR2"%% ,
% % dirnames = ["V1"];

figure(1)
tiledlayout(length(dirnames),length(allfiles))

for i = 1:length(dirnames);
    for j = 1:length(allfiles);
        my_file=allfiles(j);

        file_name=fullfile('./',dirnames(i),my_file);
            z = readmatrix(sprintf('Excursions/exc_%s_%s.csv',dirnames(i),my_file));
            comspeed = readmatrix(sprintf('Excursions/comspeed_%s_%s.csv',dirnames(i),my_file));
            [m,n]=size(z)
        ctr = 1
        for t = 40:n
            % % findpeaks(z(:,t))
            % % title(sprintf('t=%f',t))
            % % pause(0.1)
            [pks, locs] = findpeaks(z(:,t));
           
            if length(locs) > 1
                wvln(ctr)=locs(2)-locs(1);
                ctr=ctr + 1;
            end
            if isempty(locs)
            else
            pk_track(t)=locs(end);
            end
        end
        % avg_wvln = 4*pi/320*mean(wvln);
        avg_wvln = 1/320*mean(wvln);
            % keyboard   
        % find peak timing
        counter = 1;
        for t=240:n
            if pk_track(t)<pk_track(t-1)
                tailbeat(counter)=t;
                counter=counter + 1;
            end
        end
        avg_speed = mean(comspeed(400:end));
        period_avg = tailbeat(2:end)-tailbeat(1:end-1);
        mean_period = mean(period_avg);
        frps = 40;
        tail_freq = frps/mean_period;
        wave_sp = tail_freq*avg_wvln;
        ampl=0.5*(max(z(end,:)-min(z(end,:))));
        str_len = avg_speed/(4*pi*tail_freq);
        Str_no = 2*tail_freq*ampl/avg_speed;
    end
    params=[tail_freq,wave_sp,ampl,str_len,Str_no];
    writematrix(params,sprintf('Excursions/params_%s_%s.csv',dirnames(i),my_file));     
    plot(pk_track)
    hold on
    pause(0.1)
end

               
        % % % writematrix(z,sprintf('Excursions/exc_%s_%s.csv',dirnames(i),my_file));
        % % % writematrix(comsave,sprintf('Excursions/com_%s_%s.csv',dirnames(i),my_file));
        % % % writematrix(comsave,sprintf('Excursions/bodypos_%s_%s.csv',dirnames(i),my_file));
        % % % writematrix(xn,sprintf('Excursions/bodyposX_%s_%s.csv',dirnames(i),my_file));
        % % % writematrix(yn,sprintf('Excursions/bodyposY_%s_%s.csv',dirnames(i),my_file));