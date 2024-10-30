function [u, v, V] = flow_vels_from_cflow_deriv(dw_dz, flip_dir)
%FLOW_VELS_FROM_CFLOW_DERIV Gets the velocities of the flow field from the
%complex derivative of the flow field

if ~flip_dir
    % Nominal complex derivative case (no strange behaviour from complex
    % mapping that needs to be corrected)
    u = real(dw_dz);
    v = -imag(dw_dz);
else
    % In this case there is some weird behaviour due to the conformal
    % mapping which switches the direction of the flow (cannot do anything
    % given the in/out behaviour of the conformal map). Just need to flip
    % the direction of the velocity to fix it
    u = -1 * real(dw_dz);
    v = -1 * -imag(dw_dz);
end

V = sqrt(u .^ 2 + v .^ 2);

end

