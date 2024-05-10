function [x, y] = dynamicEuler(dydx, x0, y0, xEnd, h)
    % dydx: Function handle for the derivative (dy/dx)
    % x0: Initial value of x
    % y0: Initial value of y
    % xEnd: Ending value of x
    % h: Step size

    % Calculate the number of steps
    steps = floor((xEnd - x0) / h);

    % Initialize arrays for x and y values
    x = (x0:h:x0+steps*h)';
    y = zeros(steps+1, 1);

    % Set initial condition
    y(1) = y0;

    % Apply Euler's method
    for i = 1:steps
        y(i+1) = y(i) + h * dydx(x(i), y(i));
    end
end

% Example usage:
% Define the differential equation as a function handle
dydx = @(x, y) -6 * y;

% Call the dynamicEuler function with the ODE, initial conditions, and step size
[x, y] = dynamicEuler(dydx, 0, 1, 1, 0.1);

% Plot the result
plot(x, y, 'b', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('Dynamic Euler Method');
grid on;

