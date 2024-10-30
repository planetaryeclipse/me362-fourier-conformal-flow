function [dw_dz] = calc_cflow_deriv(w, z)
%CALC_CFLOW_DERIV Calculates derivative of the complex flow field with 
%respect to the input positions (also specified as complex coordinates)

% For higher order numerical accuracy, a central finite difference will be 
% used (aside from on edges where forward and backwards finite differences 
% will be used). Note that the direction of the finite difference does not
% matter as the derivative will come out to be the same when
% differentiating complex variables irrespective of direction of the limit.

z_domain_size = size(z);
dw_dz = zeros(z_domain_size);

for j=1:z_domain_size(1)
    if j == 1
        % Use the forward finite difference as at lowest row
        dw_dz(j, :) = (w(j+1, :) - w(j, :)) ./ (z(j+1, :) - z(j, :));
    elseif j == z_domain_size(1)
        % Use the backward finite difference as at highest row
        dw_dz(j, :) = (w(j, :) - w(j-1,:)) ./ (z(j, :) - z(j-1,:));
    else
        % Use central finite difference
        dw_dz(j, :) = (w(j+1, :) - w(j-1, :)) ./ (z(j+1, :) - z(j-1, :));
    end
end

end

