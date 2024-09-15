% Monte Carlo estimation of π
% Fixed number of random points
% Plot π estimation and deviation, execution time

clear; clc; close all;

% Number of random points
num_points = [10^2, 10^3, 10^4, 10^5, 10^6, 10^7];

% Preallocate arrays
pi_estimates = zeros(size(num_points));
deviation = zeros(size(num_points));
execution_time = zeros(size(num_points));

true_pi = pi; % Reference value of π

for i = 1:length(num_points)
    N = num_points(i);
    
    % Start timing
    tic;
    
    % Generate random points (x, y) between [0, 1]
    x = rand(1, N);
    y = rand(1, N);
    
    % Check if points fall within the quarter circle
    inside_circle = (x.^2 + y.^2) <= 1;
    
    % Estimate π based on the ratio of points inside the circle
    pi_estimates(i) = 4 * sum(inside_circle) / N;
    
    % Stop timing
    execution_time(i) = toc;
    
    % Compute deviation from the true value of π
    deviation(i) = abs(pi_estimates(i) - true_pi);
end

% 1. Plotting Estimated value of π versus the number of points
figure;
plot(log10(num_points), pi_estimates, 'b-o', 'LineWidth', 2);
hold on;
yline(true_pi, '--r', 'LineWidth', 2);
title('Estimated value of \pi versus Number of Points');
xlabel('log_{10}(Number of Points)');
ylabel('Estimated \pi');
legend('Estimated \pi', 'True \pi');
grid on;

% Save the first figure as .png
saveas(gcf, 'pi_estimation_plot.png');

% 2. Plotting Deviation of Estimated π from True Value
figure;
plot(log10(num_points), deviation, 'g-o', 'LineWidth', 2);
title('Deviation of Estimated \pi from True Value');
xlabel('log_{10}(Number of Points)');
ylabel('Deviation');
legend('Deviation');
grid on;

% Save the second figure as .png
saveas(gcf, 'pi_deviation_plot.png');

% 3. Plotting Execution Time versus Number of Points
figure;
plot(log10(num_points), execution_time, 'r-o', 'LineWidth', 2);
xlabel('log_{10}(Number of Points)');
ylabel('Execution Time (seconds)');
title('Execution Time versus Number of Points');
grid on;

% Save the third figure as .png
saveas(gcf, 'execution_time_plot.png');

% 4. Plotting Precision versus Computational Cost
figure;
plot(execution_time, deviation, 'k-o', 'LineWidth', 2);
xlabel('Execution Time (seconds)');
ylabel('Deviation');
title('Precision versus Computational Cost');
grid on;

% Save the fourth figure as .png
saveas(gcf, 'precision_vs_cost_plot.png');
