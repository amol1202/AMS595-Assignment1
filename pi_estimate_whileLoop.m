% AMS 595 - Assignment 1
% Using a while loop

% Initializing the parameters
required_precision = 1e-3; % Precision that is required (e.g., 0.001 for 3 significant figures)
initial_points = 10^3; % Initial number of points
points_increment = 10^3; % Number of points to add in each iteration

% Also, I have added this parameter to prevent infinite loop
max_iterations = 1000;

% Initialization
num_points = initial_points;
prev_pi_estimate = 0;
deviation = Inf; % Good starting piont, this will keep on updating in the loop.
iteration_count = 0;

while deviation > required_precision && iteration_count < max_iterations
    % Generating random points (x, y) between [0, 1]
    x = rand(1, num_points);
    y = rand(1, num_points);
    
    % Checking if points fall within the quarter circle
    inside_circle = (x.^2 + y.^2) <= 1;
    
    % Estimating π based on the ratio of points inside the circle
    pi_estimate = 4 * sum(inside_circle) / num_points;
    
    % Calculating the deviation from previous estimate
    if iteration_count > 0
        deviation = abs(pi_estimate - prev_pi_estimate);
    end
    
    % Updating previous estimate
    prev_pi_estimate = pi_estimate;
    
    % Increment number of points
    num_points = num_points + points_increment;
    
    % Increment iteration count
    iteration_count = iteration_count + 1;
end

% Results
fprintf('Estimated value of π: %.6f\n', pi_estimate);
fprintf('Number of points used: %d\n', num_points);
fprintf('Number of iterations: %d\n', iteration_count);
fprintf('Final deviation: %.6f\n', deviation);

% Plotting the result
figure;
plot(num_points - points_increment, pi_estimate, 'bo', 'MarkerSize', 10, 'LineWidth', 2);
title('Estimated Value of π');
xlabel('Number of Points');
ylabel('Estimated π');
grid on;

% Save the figure as .png
saveas(gcf, 'Result_Files\pi_estimation_precision_plot.png');