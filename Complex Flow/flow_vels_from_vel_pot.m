function [u, v, V] = flow_vels_from_vel_pot(vel_pot, z)
%FLOW_VELS_FROM_SF Calculates the velocity vector from the corresponding
%value of the velocity potential function
%values and the given locations

xx = real(z);
yy = imag(z);

u = zeros(size(z));
v = zeros(size(z));
V = zeros(size(z));

% Given the potential discontinuity that could be introduced due to the
% crossover from -pi to pi (default MATLAB domain), we will instead compute
% the numerical derivative wiht respect to the radial direction (change in
% rows)

num_radial = size(z, 1);
for j=1:num_radial
    if j==1
        % Uses the forward derivative
        u(j, :) = (vel_pot(j+1,:) - vel_pot(j,:)) ./ (xx(j+1,:) - xx(j,:));
        v(j, :) = (vel_pot(j+1,:) - vel_pot(j,:)) ./ (yy(j+1,:) - yy(j,:));  
    elseif j==num_radial
        % Uses the backward derivative
        u(j, :) = (vel_pot(j,:) - vel_pot(j-1,:)) ./ (xx(j,:) - xx(j-1,:));
        v(j, :) = (vel_pot(j,:) - vel_pot(j-1,:)) ./ (yy(j,:) - yy(j-1,:)); 
    else
        % Uses the central derivative for accuracy
        u(j, :) = (vel_pot(j+1,:) - vel_pot(j-1,:)) ./ (xx(j+1,:) - xx(j-1,:));
        v(j, :) = (vel_pot(j+1,:) - vel_pot(j-1,:)) ./ (yy(j+1,:) - yy(j-1,:));  
    end

    V(j, :) = sqrt(u(j, :) .^ 2 + v(j, :) .^ 2);
end

end

