function [vals] = calc_vals_from_taylor_series(k_coeffs, x)
%CALC_VALS_FROM_TAYLOR_SERIES Calculates the complex value of the Taylor
%series using the input

num_domain = length(x);
vals = zeros(1, num_domain);

num_coeffs = length(k_coeffs); % Coefficient 0 is the constant
for i=1:num_coeffs
    vals = vals + k_coeffs(i) * x.^(i-1);
end

end

