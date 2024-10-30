function [w] = cflow_vortex(vortex_str, z)
%CFLOW_VORTEX Vortex flow with a given vortex strength
w = -1j*vortex_str*log(z);
end

