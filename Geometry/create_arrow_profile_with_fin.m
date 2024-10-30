function [arrow_z_pos] = create_arrow_profile_with_fin(D, L_c, L_tc, L_m, L_f, L_t, fin_z_pos, tip_z_pos, curve_res)
%CREATE_ARROW_PROFILE_WITH_FIN Creates the whole arrow profile with
%inclusion of the provided fin profile

% Only the top half is initially computed, the bottom half is assumed to be
% generated from a reflection across the horizontal axis

% Uses the provided tip profile
forw_cap_z_pos = tip_z_pos;

% Calculates the main body profile
main_length_left = -1+L_c;
main_length_z_pos = linspace(main_length_left, main_length_left + L_m) + j*D/2;

% Translates the fin profile to slot into the fin
fin_start = main_length_left + L_m;
fin_transl_z_pos = fin_z_pos + (fin_start + j*D/2);

% Calculate the trailing body (following fin before cap) profile
trail_start = fin_start + L_f;
trail_profile_z_pos = linspace(trail_start, trail_start+L_t, 10) + j*(D/2);

% Calculates the profile for the trailing cap
trailing_cap_start = trail_start + L_t;
trailing_cap_domain = linspace(trailing_cap_start, trailing_cap_start + L_tc, curve_res);
trailing_cap = ellipse_y_pos(trailing_cap_domain-trailing_cap_start, L_tc, D/2);

trailing_cap_z_pos = trailing_cap_domain + j*trailing_cap;

% Calculates the top profile (which will be reflected across the origin)
arrow_top_profile_z_pos = [ ...
    forw_cap_z_pos ...
    main_length_z_pos(2:end) ...
    fin_transl_z_pos(2:end) ...
    trail_profile_z_pos(2:end) ...
    trailing_cap_z_pos(2:end)
];
arrow_bottom_profile_z_pos = conj(arrow_top_profile_z_pos(end:-1:1));

% The same point connecting the midpoint between the final profile has been
% removed so that no points are duplicate in the center of the profile.
% However, the first and last point are the same to allow for correct
% interpolation in later uses of the output of this function.
arrow_z_pos = [arrow_top_profile_z_pos arrow_bottom_profile_z_pos(2:(end))];

end

