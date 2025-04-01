close all
clear all
clc

set(0,'DefaultAxesLineStyleOrder','-|-.|--|:','DefaultLineLineWidth',2)
set(0,'DefaultLineMarkerSize',10) % Change this to change the size of the marker
set(0,'DefaultTextFontSize',18)
set(0,'DefaultAxesFontSize',18)
% get the screen size for plotting
screen_size = get(0, 'ScreenSize');
% % allfiles= ["HM0NSAR2"];
% % dirnames = ["V1"];

allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
dirnames = ["VP5","V1","V2","V10"];

for j = 1:length(allfiles)  % Cycle through injury types

    for k = 1:length(dirnames)   % Cycle through viscosity types


        file_name=fullfile('./',dirnames(k),allfiles(j))
        XY = readmatrix(file_name,"FileType","text");
        npt=321;
        [m]=size(XY,1);
        nfr = m/(npt*4);

        x_vals = reshape(XY(:,1),4*npt,nfr);
        y_vals = reshape(XY(:,2),4*npt,nfr);

        xn = x_vals(npt+1:2*npt,:);
        yn = y_vals(npt+1:2*npt,:);

        x = xn(end,241:400); % x-coordinates of the tail position
        y = yn(end,241:400); % y-coordinates of the tail position
        t = 0:length(y); % time points corresponding to the positions
        t = t*0.025;
        % Calculate the swimming speed (U)
        delta_x = diff(x);
        delta_y = diff(y);
        distance = sqrt(delta_x.^2 + delta_y.^2);
        total_distance = sum(distance);
        total_time = t(end) - t(1);
        U = total_distance / total_time;

        % Calculate the frequency of the tail beat (f)
        % Using FFT to find the dominant frequency
        Fs = 1/mean(diff(t)); % Sampling frequency
        y_centered = y - mean(y); % Centering the y data
        figure(10)
        subplot(2,1,1)
        plot(y)
        subplot(2,1,2)
        plot(y_centered)
        pause(0.1)
        Y = fft(y_centered);
        L = length(y_centered);
        P2 = abs(Y/L);
        P1 = P2(1:L/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        f = Fs*(0:(L/2))/L;

        % Find the peak frequency in the FFT
        [~, idx] = max(P1);
        f_tailbeat = f(idx);

        % Calculate the amplitude of the tail beat (A)
        A = (max(y) - min(y)) / 2;

        % Calculate the Strouhal number (St)
        St = 2*(f_tailbeat * A) / U;
        St_table(k,j)=St;
        freq_tb(k,j)=f_tailbeat;
        amp_tb(k,j)=A;
        % Display the result
        % % fprintf('Strouhal Number %d,%d: %.4f\n',k,j, St);
    end
end
close all
figure(1)
bar(1:12,St_table)
ylabel("St")
xticks(1:12)
xticklabels({"HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"})
legend("x1/2","x1","x2","x10","Location","EastOutside")
title('Strouhal Number')
set(1, 'Position', [0 0 0.8*screen_size(3) 0.8*screen_size(4) ] );
export_fig(sprintf('./Strouhalno'),'-png','-nocrop')
figure(2)
bar(1:12,freq_tb)
ylabel("frequency")
xticks(1:12)
xticklabels({"HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"})
legend("x1/2","x1","x2","x10","Location","EastOutside")
title('frequency')
set(2, 'Position', [0 0 0.8*screen_size(3) 0.8*screen_size(4) ] );
export_fig(sprintf('./FreqTable'),'-png','-nocrop')

figure(3)
bar(1:12,amp_tb)
ylabel("amplitude")
xticks(1:12)
xticklabels({"HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"})
legend("x1/2","x1","x2","x10","Location","EastOutside")
title('amplitude')
set(3, 'Position', [0 0 0.8*screen_size(3) 0.8*screen_size(4) ] );
export_fig(sprintf('./AmpTable'),'-png','-nocrop')
