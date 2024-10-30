function [tip_pos_z] = create_tip_profile(L_c, L_h, D, curve_res)
%CREATE_TIP_PROFILE Computes the profile for the leading cap

forw_cap_domain = linspace(-1, -1+L_c, curve_res);
forw_cap = ellipse_y_pos(forw_cap_domain+(1-L_c), L_c, D/2);

tip_pos_z = forw_cap_domain + j*forw_cap;
end

