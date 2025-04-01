close all
figure
nfr = 600;
for i = 1:nfr

    x=xn(:,i);
    y=yn(:,i);
    x_c=comx(i);
    y_c=comy(i);
    d_x=bodyA(1,i);
    d_y=bodyA(2,i);
    % % [x_rot, y_rot] = rotate_body_frame(x, y, x_c, y_c, d_x, d_y);
     [x_rot, y_rot, theta_tail_rad] = rotate_and_find_tail_angle(x, y, x_c, y_c, d_x, d_y)
    % % num_tail_points=5;
    theta_tail5pts(i) = theta_tail_rad;
    % % plot(x(310:end),y(310:end))
    % % hold on
    % % plot([x(310) x(310)+d_x],[y(310) y(310)+d_y])
    % % pause(0.1)

end
close all
plot(theta_tail5pts)

