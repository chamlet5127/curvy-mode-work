function [toReturn]=COTfn(pullcut,dirname, nfr, nsegs, asegs, dt,theta_segs,nosc,my_time,beg,daend,case_name,sd)

phase_file = 'fort.55554';
num_files=length(dirname)

for i = 1:num_files
    fullname = ['./' dirname{i}];
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
    
    meanfreqLa = mean(avg_Labove);
    meanfreqRa = mean(avg_Rabove);
    
    meanfreqa(i)= (meanfreqLa+meanfreqRa)/2.0;
    
% Calculating center of mass speed
    [xm xn xl xr ym yn yl yr] = import_positions(dirname{i}, nfr, nsegs, asegs);
    
    [width1,area1,sn1, comx1,comy1,comvelx1,comvely1] = estcomspeed(my_time,xm,ym,xn,yn,xl,xr,yl,yr);
    com_speed{i} = sqrt(comvelx1.^2 + comvely1.^2);


% Muscle Power
    [PowPosL PowPosR PowNegL PowNegR] = import_power(dirname{i}, nfr, nsegs, asegs);
    % Muscle Power Count (out of 1000)
    [PowPosCL PowPosCR PowNegCL PowNegCR] = import_power_count(dirname{i}, nfr, nsegs, asegs);
    
    tot = 1000; % total dumps in a cycle
    num_dumps = round(1.0./(dt.*meanfreqa(i)));
    cycles = 120:num_dumps:nfr;
    
    for j = 2:length(cycles)
        avg_com(j-1) = mean(com_speed{i}(cycles(j-1):cycles(j)));
    end
    
    com_thresh= diff(avg_com);
    avg_com_speed(i) = mean([avg_com(diff(avg_com)<0.042) avg_com(end)]);
    
    steadycycles = [cycles(diff(avg_com)<0.042) cycles(end-1:end)];
    
    distTraveled = calc_distance(comx1,comy1,(steadycycles(1)),(steadycycles(end)));
    myTaper = calc_Taper(yl,yn,nfr);
    myMass = 1.0;
    
    costOT(i) = calc_cost(PowPosL, PowPosR, PowNegL, PowNegR,...
        PowPosCL, PowPosCR, PowNegCL, PowNegCR, myTaper, myMass, ...
        distTraveled, beg, daend, steadycycles(1),steadycycles(end), tot,dt);
    
end

switch sd
    case 0
        plot(2:5, costOT(2:5)./costOT(1),'s-k','MarkerSize',10)
    case 1
        plot(2:5, costOT(2:5)./costOT(1),'s-.b','MarkerSize',10)
    case 2
        plot(2:5, costOT(2:5)./costOT(1),'s--r','MarkerSize',10)
    case 3
        plot(2:5, costOT(2:5)./costOT(1),'s:m','MarkerSize',10)
    case 4
        plot(2:5, costOT(2:5)./costOT(1),'d-k','MarkerSize',10)
    case 5
        plot(2:5, costOT(2:5)./costOT(1),'d-.b','MarkerSize',10)
    case 6
        plot(2:5, costOT(2:5)./costOT(1),'d--r','MarkerSize',10)
    case 7
        plot(2:5, costOT(2:5)./costOT(1),'d:m','MarkerSize',10)
    otherwise
        plot(2:5, costOT(2:5)./costOT(1),'o-','MarkerSize',10)
end
toReturn = case_name;


end