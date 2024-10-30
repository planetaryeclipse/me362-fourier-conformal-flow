function [tip_pos_z] = create_pointy_tip_profile(L_c, h_c, D, curve_res)
%CREATE_POINTY_TIP_PROFILE Creates the profiile for the pointy tip

% Linear profile functions
lin_profile_pos = @(x, L_c, h_c) (h_c/L_c)*x;

% Plotting
forw_cap_domain = linspace(-1, -1+L_c, curve_res);
forw_cap_top = (h_c+D/2)/L_c.*(forw_cap_domain+1);
top_tip_precedding_line_z_pos = forw_cap_domain + i*forw_cap_top;

%Trail going down 
% trail_domain = linspace(L_c, L_c, curve_res);
% trail_y = linspace(h_c+D/2, D/2,curve_res);
% top_tip_trail_line_z_pos = trail_domain + i*trail_y;

top_tip_trail_line_z_pos = -1+L_c + 1j*linspace(D/2, D/2 + h_c, 2);

% Combine x-values and y-values into complex numbers
%top_forw_cap_z_pos = forw_cap_domain + 1i*forw_cap_top;

%tip_pos_z = top_forw_cap_z_pos;

tip_pos_z = [top_tip_precedding_line_z_pos top_tip_trail_line_z_pos(2:end)];
end
