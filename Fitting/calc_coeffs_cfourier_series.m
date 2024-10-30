function [c0, cn, n_cn] = calc_coeffs_cfourier_series(cvals, z_domain, period, nterms)
%CALC_COEFFS_CFOURIER_SERIES Calculates the complex Fourier series

num_vals = length(cvals);

% Integral calculations
c0_int = 0;
cn_int = zeros(1, nterms);
n_cn_int = zeros(1, nterms);

half_period = period/2;

% cperiod = z_domain(end) - z_domain(1);

for i=1:(num_vals-1)
    % Use the centered numerical integral to increase accuracy
    avg_cval = (cvals(i) + cvals(i+1)) / 2;
    z_diff = z_domain(i+1) - z_domain(i);

    c0_int = c0_int + avg_cval * z_diff;
    for n=1:nterms
        cn_int(n) = cn_int(n) + avg_cval * exp(-j*n*pi*(z_domain(i) + 1/2*z_diff)/half_period) * z_diff;
        n_cn_int(n) = n_cn_int(n) + avg_cval * exp(-j*(-n)*pi*(z_domain(i) + 1/2*z_diff)/half_period) * z_diff;
    end
end

c0 = 1/(period) * c0_int;
cn = 1/(period) * cn_int;
n_cn = 1/(period) * n_cn_int;

end

