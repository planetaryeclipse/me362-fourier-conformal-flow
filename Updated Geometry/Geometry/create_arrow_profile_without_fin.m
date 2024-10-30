function [arrow_z_pos] = create_arrow_profile_without_fin(D, L_c, L_tc, L_m, L_f, L_t, curve_res)
%CREATE_ARROW_PROFILE_WITHOUT_FIN Creates the whole arrow profile without
%inclusion of any fin profile (replaced with a straight line)

flat_fin_z_pos = linspace(0, L_f, curve_res);
arrow_z_pos = create_arrow_profile_with_fin(D, L_c, L_tc, L_m, L_f, L_t, flat_fin_z_pos, curve_res);

end

