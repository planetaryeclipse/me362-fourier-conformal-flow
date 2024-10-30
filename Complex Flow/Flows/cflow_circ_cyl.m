function [w] = cflow_circ_cyl(fs_vel, ang, doublet_str, vortex_str, z)
%CFLOW_CIRC_CYL Circulating cylinder flow is comprised of a doublet at the
%origin, vortex, and uniform flow with a given uniform velocity and
%direction in addition to doublet and vortex strength

w = cflow_uniform(fs_vel, ang, z) + exp(1j*ang) .* cflow_doublet(doublet_str, z) + cflow_vortex(vortex_str, z);
end

