function [vals] = calc_vals_from_fourier_series(a0, an, bn, t_domain)
%CALC_VALS_FROM_FOURIER_SERIES Generates values from Fourier series
%coefficients and specified domain

% Sets up the values with the same number of elements as the domain
num_domain = length(t_domain);
vals = zeros(1, num_domain);

% Calculates the values from the coefficients
vals = vals + a0;
for n=1:length(an)
    vals = vals + an(n) * cos(n*t_domain) + bn(n) * sin(n*t_domain);
end

end

