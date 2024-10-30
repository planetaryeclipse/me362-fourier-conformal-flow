function [k_coeffs] = calc_coeffs_taylor_series(order, meas_depen, meas_indep)
%CALC_COEFFS_TAYLOR_SERIES Calculates the complex Taylor series using the
%least squares polynomial fit

num_variables = order;
num_data_points = length(meas_indep);

Z = [ones(num_data_points, 1)]; % Constant function is 1
for i=1:order
    Z = [Z (meas_indep').^i];
end

k_coeffs = (Z'*Z)\(Z'*meas_depen');

end

