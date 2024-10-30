function [interp_z_pos] = interp_even_dists_from_z_profile(z_pos, num_interp_points)
    num_profile_points = length(z_pos);
    dists_at_points = zeros(1, num_profile_points);

    % Computes the distance from the start of every point in the profile
    dists_at_points(1) = 0; % Starts at 0 distnace at the first point
    for i=2:num_profile_points
        dists_at_points(i) = dists_at_points(i-1) + abs(z_pos(i) - z_pos(i-1));
    end
    max_dist = dists_at_points(end);

    % Finds the distances that interpolation needs to be completed at
    incr_interp_dist = max_dist / (num_interp_points - 1);
    interp_dists = incr_interp_dist * (0:num_interp_points);
    
    % For each point to interpolate, finds the points with bounding
    % distance and then linearly interpolates the point

    interp_z_pos = zeros(1, num_interp_points);
    interp_z_pos(1) = z_pos(1); % Sets as are bounds of the interpolation
    interp_z_pos(end) = z_pos(end);

    for i=2:(num_interp_points-1)
        curr_dist = interp_dists(i);
        for j=1:num_profile_points
            if curr_dist >= dists_at_points(j) && curr_dist <= dists_at_points(j+1)
                % Interpolation must be made here
                lower_dist_z_pos = z_pos(j);
                lower_dist = dists_at_points(j);

                upper_dist_z_pos = z_pos(j+1);
                upper_dist = dists_at_points(j+1);

                interp_z_pos(i) = lower_dist_z_pos + (upper_dist_z_pos - lower_dist_z_pos) / (upper_dist - lower_dist) * (curr_dist - lower_dist);
                break
            end
        end
    end
end