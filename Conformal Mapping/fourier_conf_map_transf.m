function zeta = fourier_conf_map_transf(c0, cn, n_cn, z, period, k_stab)
%FOURIER_CONF_MAP Conformal mapping considers radius with consideration of
%the stability factor (k_stab) to try and stabilize the numerical result

% Produces the angle and radial components so they can be used in the
% modified Fourier series considering additional flow.
rr = abs(z);

angang = angle(z);
% angang = angang(end:-1:1, :);

half_period = period / 2;

% Modifying this functoin so that 0 ALWAYS outputs 0 to allow regions in
% the conformal map to be ignored due to being invalid data

zeta = c0 * ones(size(z));

for n=1:length(cn)
    % Accounts for both positive and negative n
    
    % Flips the mapping in direction from the nominal line (was tried in
    % trying to fix the conformal mapping with in/out mapping behaviour)
    % zeta = zeta + cn(n) .* (2-rr) .^(k_stab*n) .* exp(j*n*pi*angang/half_period);
    % zeta = zeta + n_cn(n) .* (2-rr) .^ (k_stab*n) .* exp(j*(-n)*pi*angang/half_period);

    zeta = zeta + cn(n) .* rr .^(k_stab*n) .* exp(j*n*pi*angang/half_period);
    zeta = zeta + n_cn(n) .* rr .^ (k_stab*n) .* exp(j*(-n)*pi*angang/half_period);
end

end