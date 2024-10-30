function [p] = calc_pressure_no_grav_bern(dens, v, v0, p0)
%CALC_PRESSURE_NO_GRAV_BERN Calculates the pressure at a given location
%using the velocity profile from Bernoulli's equation. Pressure variation
%due to changes in gravity have been ignored in this function.

p = 1/2*dens*(v0.^2 - v.^2) + p0;

end

