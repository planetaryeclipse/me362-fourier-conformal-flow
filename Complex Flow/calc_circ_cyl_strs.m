function [doublet_str, vortex_str] = calc_circ_cyl_strs(fs_vel, fs_ang, circ_rad, sp_ang)
%CALC_CIRC_CYL_STRS Calculates doublet and vortex strength for desired flow
%characteristics and appearance

doublet_str = fs_vel*(circ_rad)^(2);
vortex_str = -circ_rad*exp(1j*sp_ang)*(fs_vel*exp(-1j*fs_ang) - doublet_str/circ_rad^2*exp(-1j*2*sp_ang))*1j;

end

