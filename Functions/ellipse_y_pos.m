function [y] = ellipse_y_pos(x, a, b)
%FUNC_ELLIPSE_Y_POS Positive y solution to ellipse
y = sqrt(b^2*(1-x.^2/a^2));
end

