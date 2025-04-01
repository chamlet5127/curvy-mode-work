function PlotFreqFn(dir_name,phase_file,dt,pullcut,theta_segs,nfr,nosc)


num_files=length(dir_name)
for i = 1:num_files
    fullname = ['./' dir_name{i}];
    if i == 1
        the_cut = 280;
       
    else
        the_cut = pullcut;
        
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calculating Frequencies
    
    total_file = fullfile(fullname,phase_file);
    
    theta = dlmread(total_file);
    
    thetaL = reshape(theta(:,2),theta_segs,nfr);
    thetaL = thetaL(1:nosc,:);
    
    thetaR = reshape(theta(:,3),theta_segs,nfr);
    thetaR = thetaR(1:nosc,:);
    
    dthetaL_dt = (thetaL(:,2:end)-thetaL(:,1:end-1))./dt;
    dthetaR_dt = (thetaR(:,2:end)-thetaR(:,1:end-1))./dt;
    
    avg_Labove = mean(dthetaL_dt(1:the_cut,200:end),1);
    avg_Rabove = mean(dthetaR_dt(1:the_cut,200:end),1);
    
    avg_Lbelow = mean(dthetaL_dt(the_cut:end,200:end),1);
    avg_Rbelow = mean(dthetaR_dt(the_cut:end,200:end),1);
    
    meanfreqLa = mean(avg_Labove);
    meanfreqRa = mean(avg_Rabove);
    meanfreqLb = mean(avg_Lbelow);
    meanfreqRb = mean(avg_Rbelow);
    
    meanfreqa(i)= (meanfreqLa+meanfreqRa)/2.0;
    meanfreqb(i)= (meanfreqLb+meanfreqRb)/2.0;
end

%%%%%%%%%%%%%%%%%%%%%%%%
% Separated Frequency plots

plot(1:3, meanfreqa(5)./meanfreqa(1).*ones(1,3),'*-','Color',[0.5 0.5 0.5])
hold on
plot(1:3, meanfreqb(5)./meanfreqa(1).*ones(1,3),'*-','Color',[0.5 0.5 0.5])
hold on
plot(1:3, meanfreqa(2:4)/meanfreqa(1),'*-b')
hold on
plot(1:3, meanfreqb(2:4)/meanfreqa(1),'*:r')
axis([0 4 -0.5 1.5])

end