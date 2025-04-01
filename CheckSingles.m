npt=321;
nlines=4;
% % allfiles= ["HM0NSAR2","HM4NSAR2","AO50NF","AO50N4","AO150NF","AO150N4","SL50NF","SL50N4","SL50N4x10","SL150NF","SL150N4","SL150N4x10"]; %% ,"HM4NSAR2"%% ,
% % dirnames = ["VP5","V1","V2","V10"];
% % dirnames = ["V1","V2","V10"];

allfiles= ["SL50N4"]; %% ,"HM4NSAR2"%% ,
dirnames = ["V1"];


%figure(1)
for i = 1:length(dirnames)
    for j = 1:length(allfiles)
        my_file=allfiles(j);

        file_name=fullfile('./',dirnames(i),my_file);

        bodyA = readmatrix(sprintf('Excursions/Abodyaxis_%s_%s.csv',dirnames(i),my_file));
        com= readmatrix(sprintf('Excursions/com_%s_%s.csv',dirnames(i),my_file));
        comx=com(1,:);
        comy=com(2,:);
        xn = readmatrix(sprintf('Excursions/bodyposX_%s_%s.csv',dirnames(i),my_file));
        yn = readmatrix(sprintf('Excursions/bodyposY_%s_%s.csv',dirnames(i),my_file));
        nfr = 600;
        prev_d_x=0;
        prev_d_y=0;
        prev_dx_tail=0;
        prev_dy_tail=0;
        for k = 1:nfr

            x=xn(:,k);
            y=yn(:,k);
            x_c=comx(k);
            y_c=comy(k);
            d_x=bodyA(1,k);
            d_y=bodyA(2,k);
            numtailpoints=10;
            %%theta_tail(k) = compute_tail_angle_2D(x, y, x_c, y_c, d_x, d_y, num_tail_points);
            % % [x_rot, y_rot] = rotate_body_frame(x, y, x_c, y_c, d_x, d_y);
            [x_rot, y_rot, theta_tail_rad, vertical_dist, d_x_updated, d_y_updated, dx_tail_updated, dy_tail_updated] = rotate_and_find_tail_angle(x, y, x_c, y_c, d_x, d_y, prev_d_x, prev_d_y, prev_dx_tail, prev_dy_tail);            % % num_tail_points=5;
            theta_tail(k) = theta_tail_rad;
            vert_tail(k)=vertical_dist;
            prev_d_x=d_x_updated;
            prev_d_y=d_y_updated;
            prev_dx_tail=dx_tail_updated;
            prev_dy_tail=dy_tail_updated;
            pause(0.1)
        end
        % % if max(theta_tail)>90
        % %     keyboard
        % % end
        % figure(2)
        plot(theta_tail)
        hold on
        max_thetas(i,j)=max(theta_tail(250:end));
        figure(2)
        plot(vert_tail)
        hold on

    end
end
