% Monte Carlo estimation of π using while loop to a specified precision
function [pi_estimate, iterations] = pi_estimate_while_loop(precision)

    % Initialize variables
    points_in_circle = 0;
    total_points = 0;
    pi_estimate = 0;
    error = 1;

    % Loop until precision is reached
    while error > precision
        x = rand(); % Random x-coordinate
        y = rand(); % Random y-coordinate
        total_points = total_points + 1;
        distance = sqrt(x^2 + y^2); % Distance from origin

        if distance <= 1
            points_in_circle = points_in_circle + 1;
        end

        % Estimate π and compute error
        pi_estimate = 4 * (points_in_circle / total_points);
        error = abs(pi_estimate - pi);
    end

    iterations = total_points;
    fprintf('π estimated to %g precision in %d iterations: %.15f\n', precision, iterations, pi_estimate);
end
