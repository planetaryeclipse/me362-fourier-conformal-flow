function [fin_z_pos] = create_linear_ellipse_fin_profile(L_f, L_fl, h_f, curve_res)
%CREATE_FIN_PROFILE Creates a linear profile with a nonsustained ellipse
%falloff back to the main body of the fin

fin_trail_curve_domain = linspace(0, (L_f-L_fl), curve_res);
fin_trail_curve_top = ellipse_y_pos(fin_trail_curve_domain, (L_f-L_fl), h_f);

fin_curve_z_pos = fin_trail_curve_domain + j*fin_trail_curve_top;

% Calculates the preceding linear profile
fin_lin_domain = linspace(0, L_fl, curve_res);
fin_lin = h_f/L_fl * (fin_lin_domain);

fin_lin_z_pos = fin_lin_domain + j*fin_lin;

fin_z_pos = [fin_lin_z_pos (fin_curve_z_pos(2:end)+L_fl)];

end

