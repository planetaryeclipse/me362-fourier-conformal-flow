function [w] = cflow_uniform(fs_vel, ang, z)
%CFLOW_UNIFORM Uniform flow with a given velocity and direction

w = fs_vel * z .* exp(-j*ang);
end

