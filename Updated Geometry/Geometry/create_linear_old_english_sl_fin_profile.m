function [fin_z_pos] = create_linear_Pope_Young_fin_profile(L_f, L_fl, h_f, curve_res)
%CREATE_FIN_PROFILE Creates Old English KL Fin Style
%Ideal Lf = 6 and hf = 2 

fin_start = 0;
L_fl = L_f;

% if L_f ~= Lf
%     break 
%     disp('Lf has to be equal to Lfl')
% end 

% Calculates the preceding linear profile
fin_preceding_domain = linspace(fin_start, fin_start + L_fl, curve_res); % this is the x domain, never change this
top_fin_preceding = 1/2*sqrt((fin_preceding_domain-fin_start));

top_fin_preceding_curve_z_pos = fin_preceding_domain + j*top_fin_preceding;

% Calculates the profile for the trailing edge of the fin
fin_trail_curve_start = fin_start + L_fl;

fin_trail_curve_domain = linspace(fin_trail_curve_start, fin_trail_curve_start , curve_res); % Never change
fin_trail_curve_top = linspace(1/10*h_f,0, curve_res);

top_fin_trail_curve_z_pos = fin_trail_curve_domain + j*fin_trail_curve_top;


fin_z_pos = [top_fin_preceding_curve_z_pos top_fin_trail_curve_z_pos(2:end)];
end 

