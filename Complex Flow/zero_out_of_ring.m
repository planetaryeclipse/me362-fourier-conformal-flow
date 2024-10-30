function [d_zeroed] = zero_out_of_ring(d, z, min_valid_rad, max_valid_rad)
%ZERO_OUT_OF_RING Zero data in the provided input that lies outside of a
%given radius from the origin so as to avoid problematic data.

r = abs(z);

z_above_min = r >= min_valid_rad;
z_below_max = r <= max_valid_rad;
valid_z = z_above_min .* z_below_max;

d_zeroed = d .* valid_z;

end

