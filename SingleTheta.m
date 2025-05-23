close all
npt=321;
nlines=4;
allfiles= ["SL150NF"]; %% ,"HM4NSAR2"%% ,
% % dirnames = ["VP5","V1","V2","V10"];
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
            [x_rot, y_rot, theta_tail_rad, vertical_dist, d_x_updated, d_y_updated, dx_tail_updated, dy_tail_updated] = rotate_and_find_tail_angle_plot(x, y, x_c, y_c, d_x, d_y, prev_d_x, prev_d_y, prev_dx_tail, prev_dy_tail);
            pause(0.1)
            bodyrotX(:,k)=x_rot;
            bodyrotY(:,k)=y_rot;
            % % num_tail_points=5;
            
            theta_tail(k) = theta_tail_rad;
            vert_tail(k)=vertical_dist;
            prev_d_x=d_x_updated;
            prev_d_y=d_y_updated;
            prev_dx_tail=dx_tail_updated;
            prev_dy_tail=dy_tail_updated;
        end
        % % if max(theta_tail)>90
        % %     keyboard
        % % end
        figure(2)
        plot(vert_tail)
        hold on
        max_thetas(i,j)=max(theta_tail(250:end));
        max_verts(i,j)=max(vert_tail(250:end));
% %         figure(1)
% %         writematrix(bodyrotX,sprintf('Excursions/bodyrotX_%s_%s.csv',dirnames(i),my_file));
% %         writematrix(bodyrotY,sprintf('Excursions/bodyrotY_%s_%s.csv',dirnames(i),my_file));
% %         writematrix(theta_tail,sprintf('Excursions/theta_tail_%s_%s.csv',dirnames(i),my_file));
% %         writematrix(vert_tail,sprintf('Excursions/vert_tail_%s_%s.csv',dirnames(i),my_file));

    end
end

        % % % writematrix(bodyA,sprintf('Excursions/Abodyaxis_%s_%s.csv',dirnames(i),my_file));            
        % % % writematrix(z,sprintf('Excursions/exc_%s_%s.csv',dirnames(i),my_file));
        % % % writematrix(comsave,sprintf('Excursions/com_%s_%s.csv',dirnames(i),my_file));
        % % % writematrix(comsave,sprintf('Excursions/bodypos_%s_%s.csv',dirnames(i),my_file));
        % % % writematrix(xn,sprintf('Excursions/bodyposX_%s_%s.csv',dirnames(i),my_file));
        % % % writematrix(yn,sprintf('Excursions/bodyposY_%s_%s.csv',dirnames(i),my_file));