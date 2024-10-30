function [w] = cflow_doublet(doublet_str, z)
%CFLOW_DOUBLET Doublet flow with a given doublet strength

w = doublet_str ./ z;
end

