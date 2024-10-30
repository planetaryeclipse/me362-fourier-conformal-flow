function [a0, an, bn] = calc_coeffs_ang_fourier_series(vals, t_domain, nterms)
%CALC_ANG_FOURIER_SERIES Calculates the Fourier series

num_vals = length(vals);
% t_domain = linspace(0, 2*pi, num_vals);

% Integral calculations
a0_int = 0;
an_int = zeros(1, nterms);
bn_int = zeros(1, nterms);

period = t_domain(end) - t_domain(1);

for i=1:(num_vals-1)
    % Use the centered numerical integral to increase accuracy
    avg_val = (vals(i) + vals(i+1)) / 2;

    % disp(size(t_domain))
    t_diff = t_domain(i+1) - t_domain(i);
    
    a0_int = a0_int + avg_val * t_diff;
    for j=1:nterms
        an_int(j) = an_int(j) + avg_val * cos(j * (t_domain(i) + 1/2*t_diff) * 2*pi / period) * t_diff;
        bn_int(j) = bn_int(j) + avg_val * sin(j * (t_domain(i) + 1/2*t_diff) * 2*pi / period) * t_diff;
    end
end

% a0 = 1/(2*pi) * a0_int;
% an = 1/(2*pi) * an_int;
% bn = 1/(2*pi) * bn_int;

disp('period')
disp(period)
a0 = 1/period * a0_int;
an = 2/period * an_int;
bn = 2/period * bn_int;

end

