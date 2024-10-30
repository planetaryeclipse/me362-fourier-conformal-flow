function [vel_pot, stream_func] = flow_fields_from_cflow(w)
%FLOW_FUNCS_FROM_CFLOW Calculates the velocity potential and stream
%function from the complex flow values
vel_pot = real(w);
stream_func = imag(w);
end

