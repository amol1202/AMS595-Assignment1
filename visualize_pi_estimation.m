function pi_estimate = estimate_pi_to_precision(target_precision, gif_filename)
% ESTIMATE_PI_TO_PRECISION Estimates π to a specified precision using Monte Carlo method
%   target_precision: Desired precision level (e.g., 1e-3 for 3 significant figures)
%   gif_filename: Name of the GIF file to save (e.g., 'monte_carlo_simulation.gif')

    % Check if the target precision is positive
    if target_precision <= 0
        error('Target precision must be a positive value.');
    end

    % Initialization
    num_points = 0;
    previous_pi_estimate = 0;
    iteration_count = 0;
    deviation = Inf;

    % Create a figure for plotting
    figure;
    hold on;
    title('Monte Carlo Estimation of π');
    xlabel('x');
    ylabel('y');
    axis([0 1 0 1]);
    grid on;

    % Initialize GIF file
    if nargin < 2
        gif_filename = 'monte_carlo_simulation.gif';
    end
    
    while deviation > target_precision
        % Update number of points
        num_points = num_points + 10^3; % Increase number of points
        
        % Generate random points (x, y) between [0, 1]
        x = rand(1, num_points);
        y = rand(1, num_points);
        
        % Check if points fall within the quarter circle
        inside_circle = (x.^2 + y.^2) <= 1;
        
        % Plot points
        plot(x(inside_circle), y(inside_circle), 'g.', 'MarkerSize', 5);
        plot(x(~inside_circle), y(~inside_circle), 'r.', 'MarkerSize', 5);
        
        % Estimate π based on the ratio of points inside the circle
        pi_estimate = 4 * sum(inside_circle) / num_points;
        
        % Calculate deviation from previous estimate
        deviation = abs(pi_estimate - previous_pi_estimate);
        
        % Update previous estimate
        previous_pi_estimate = pi_estimate;
        
        % Increment iteration count
        iteration_count = iteration_count + 1;
        
        % Annotate the plot with the final π estimate
        text(0.5, 0.9, sprintf('Estimated \\pi: %.6f', pi_estimate), 'HorizontalAlignment', 'center', 'FontSize', 12, 'BackgroundColor', 'white');
        
        % Capture the plot as an image for the GIF
        frame = getframe(gcf);
        img = frame2im(frame);
        [imind, cm] = rgb2ind(img, 256);
        
        % Write the first frame
        if iteration_count == 1
            imwrite(imind, cm, gif_filename, 'gif', 'LoopCount', inf, 'DelayTime', 0.1);
        else
            imwrite(imind, cm, gif_filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.1);
        end
        
        % Pause to visualize the plot update
        pause(0.01);
    end

    % Display results
    fprintf('Estimated value of π: %.6f\n', pi_estimate);
    fprintf('Number of points used: %d\n', num_points);
    fprintf('Number of iterations: %d\n', iteration_count);
    fprintf('Final deviation: %.6f\n', deviation);

    % Return the computed value of π
    pi_estimate = round(pi_estimate, -log10(target_precision));
end
