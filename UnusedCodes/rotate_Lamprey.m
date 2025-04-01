function [newx,newy] = rotate_Lamprey(xn,yn,comx,comy,nfr)
for i = 1:nfr

    r_x(i) = comx(i)-xn(1,i);
    r_y(i) = comy(i)-yn(1,i);

    magr(i) = sqrt(r_x(i).^2+r_y(i).^2);

    rot_theta(i) =acos(r_x(i)/(magr(i)));
    if r_y(i) < 0;
        rot_theta(i) = -rot_theta(i);
    end
    % %    rot_theta(i) = -rot_theta(i);

    myang = rot_theta(i);
    rotmat = [cos(myang) sin(myang);-sin(myang) cos(myang)];

    comxy = [r_x(i);r_y(i)];
    for j = 1:length(xn(:,i))


        tempxy = [xn(j,i)-xn(1,i) ; yn(j,i)-yn(1,i)];
        % %        plot(tempxy(1),tempxy(2),'g*')
        % %        hold on
        rotxy = rotmat*tempxy;
        rotcomxy(:,i) = rotmat*comxy;
        newx(j,i) = rotxy(1);
        newy(j,i) = rotxy(2);
    end
% % figure(2)
% % plot(newx(:,i),newy(:,i))
% % hold on
% % grid on
% % plot(rotcomxy(1,i),rotcomxy(2,i),'*')
% % plot(linspace(0,5*pi,1000),zeros(1,1000))
% % hold off
% % pause(0.1)
end
end