% Monte Carlo estimation of π using for loop
function pi_estimate_for_loop(num_points)

    % Initialize counters
    points_in_circle = 0;
    pi_values = zeros(num_points, 1);
    true_pi = pi;

    % Generate random points and calculate π
    for i = 1:num_points
        x = rand(); % Random x-coordinate
        y = rand(); % Random y-coordinate
        distance = sqrt(x^2 + y^2); % Distance from origin

        if distance <= 1
            points_in_circle = points_in_circle + 1;
        end

        % Estimate of π based on current points
        pi_estimate = 4 * (points_in_circle / i);
        pi_values(i) = pi_estimate;
    end

    % Plot estimated π and deviation from true π
    figure;
    subplot(2,1,1);
    plot(1:num_points, pi_values);
    title('Estimated \pi vs Number of Points');
    xlabel('Number of Points');
    ylabel('Estimated \pi');
    grid on;

    % Plot deviation from true value
    subplot(2,1,2);
    deviation = abs(pi_values - true_pi);
    plot(1:num_points, deviation);
    title('Deviation from True \pi');
    xlabel('Number of Points');
    ylabel('Deviation');
    grid on;
end
