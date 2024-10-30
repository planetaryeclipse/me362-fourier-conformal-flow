function [cvals] = calc_vals_from_cfourier_series(c0, cn, n_cn, period, z_domain)
%CALC_VALS_FROM_CFOURIER_SERIES Generates values from the complex Fourier
%series coefficients and specified domain

% Sets up the values with the same number of elements as the domain
num_domain = length(z_domain);
cvals = zeros(1, num_domain);

half_period = period/2;

cvals = cvals + c0;
for n=1:length(cn)
    % disp(cn(n))
    % disp(n_cn(n))

    cvals = cvals + cn(n) * exp(j*n*pi*z_domain/half_period);
    cvals = cvals + n_cn(n) * exp(j*(-n)*pi*z_domain/half_period);
end

end

