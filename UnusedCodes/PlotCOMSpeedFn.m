function PlotCOMSpeedFn(dir_name, nfr, nsegs, asegs,my_time)

% cm_mymap=viridis();
cm_mymap = my_map();
com_speed = cell(1,length(dir_name));
counter = 0;
n = length(dir_name);
for i=1:length(dir_name)
    
    [xm, xn, xl, xr, ym, yn, yl, yr] = import_positions(dir_name{i}, nfr, nsegs, asegs);
    
    [width1,area1,sn1, comx1,comy1,comvelx1,comvely1] = estcomspeed(my_time,xm,ym,xn,yn,xl,xr,yl,yr);
    com_speed{i} = sqrt(comvelx1.^2 + comvely1.^2);
    
      plot(my_time,com_speed{i},'Color',cm_mymap(i,:))   
% % %     if i == length(dir_name)
% % %         plot(my_time,com_speed{length(dir_name)},'Color', [0 0.5410 0.0470])
% % %     elseif i == 1 
% % %         plot(my_time,com_speed{1},'Color', [0 0.2470 0.7410])
% % %     else
% % %         plot(my_time,com_speed{i},'Color',[0.75*(1-(n-counter)/n),0.75*(1-(n-counter)/n),0.75*(1-(n-counter)/n)])
% % %     end
    hold on
    axis([0 15 0 6])
    xlabel('time (s)')
    ylabel('speed (L/s)')
%     title('COM Speed')
    counter = counter + 1;
end

end