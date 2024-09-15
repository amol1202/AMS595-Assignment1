% Monte Carlo estimation of π to a specified precision
% Using while loop to achieve desired precision

clear; clc; close all;

% Parameters
target_precision = 1e-3; % Precision target (e.g., 0.001 for 3 significant figures)
max_iterations = 1000; % Maximum number of iterations to prevent infinite loop

% Initialization
num_points = 0;
previous_pi_estimate = 0;
iteration_count = 0;
deviation = Inf;

while deviation > target_precision && iteration_count < max_iterations
    % Update number of points
    num_points = num_points + 10^3; % Increase number of points (adjust as needed)
    
    % Generate random points (x, y) between [0, 1]
    x = rand(1, num_points);
    y = rand(1, num_points);
    
    % Check if points fall within the quarter circle
    inside_circle = (x.^2 + y.^2) <= 1;
    
    % Estimate π based on the ratio of points inside the circle
    pi_estimate = 4 * sum(inside_circle) / num_points;
    
    % Calculate deviation from previous estimate
    deviation = abs(pi_estimate - previous_pi_estimate);
    
    % Update previous estimate
    previous_pi_estimate = pi_estimate;
    
    % Increment iteration count
    iteration_count = iteration_count + 1;
end

% Display results
fprintf('Estimated value of π: %.6f\n', pi_estimate);
fprintf('Number of points used: %d\n', num_points);
fprintf('Number of iterations: %d\n', iteration_count);
fprintf('Final deviation: %.6f\n', deviation);

% Plotting the result
figure;
plot(num_points, pi_estimate, 'bo', 'MarkerSize', 10, 'LineWidth', 2);
title('Estimated Value of π');
xlabel('Number of Points');
ylabel('Estimated π');
grid on;

% Save the figure as .png
saveas(gcf, 'pi_estimation_precision_plot.png');
