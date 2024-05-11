function equationSolverGUI
    % Create a figure
    fig = figure('Name', 'Equation Solver GUI', 'Position', [100, 100, 600, 400], 'MenuBar', 'none', 'NumberTitle', 'off');

    % Create UI components
    equationTypeLabel = uicontrol(fig, 'Style', 'text', 'String', 'Select Equation Type:', 'Position', [20, 350, 150, 20]);
    equationTypeDropdown = uicontrol(fig, 'Style', 'popupmenu', 'String', {'Euler Method', 'Heat Equation', 'Laplace Equation'}, 'Position', [180, 350, 150, 20]);
    
    % Euler Method Components
    eulerFuncLabel = uicontrol(fig, 'Style', 'text', 'String', 'Enter ODE function:', 'Position', [20, 300, 150, 20]);
    eulerFuncEdit = uicontrol(fig, 'Style', 'edit', 'String', 't^2', 'Enable', 'off', 'Position', [180, 300, 250, 20]); % Hardcoded to t^2
    
    eulerInitialLabel = uicontrol(fig, 'Style', 'text', 'String', 'Initial condition (y0):', 'Position', [20, 270, 150, 20]);
    eulerInitialEdit = uicontrol(fig, 'Style', 'edit', 'Position', [180, 270, 100, 20]);
    
    eulerTimeLabel = uicontrol(fig, 'Style', 'text', 'String', 'Time span [t0, tf]:', 'Position', [20, 240, 150, 20]);
    eulerTimeEdit = uicontrol(fig, 'Style', 'edit', 'Position', [180, 240, 100, 20]);
    
    eulerStepsLabel = uicontrol(fig, 'Style', 'text', 'String', 'Number of steps (N):', 'Position', [20, 210, 150, 20]);
    eulerStepsEdit = uicontrol(fig, 'Style', 'edit', 'Position', [180, 210, 100, 20]);
    
    eulerResultLabel = uicontrol(fig, 'Style', 'text', 'String', 'Result:', 'Position', [20, 160, 150, 20]);
    eulerResultText = uicontrol(fig, 'Style', 'edit', 'Max', 10, 'HorizontalAlignment', 'left', 'Position', [20, 90, 550, 60]);
    
    % Create a button to solve the equation
    solveButton = uicontrol(fig, 'Style', 'pushbutton', 'String', 'Solve Equation', 'Position', [150, 50, 100, 30], 'Callback', @solveEquation);

    % Callback function to solve the equation
    function solveEquation(~, ~)
        equationType = get(equationTypeDropdown, 'Value');
        
        switch equationType
            case 1 % Euler Method
                % Get input from GUI
                y0 = str2double(get(eulerInitialEdit, 'String'));
                tspan = str2num(get(eulerTimeEdit, 'String'));
                N = str2double(get(eulerStepsEdit, 'String'));
                
                % Call Euler Method solver
                y = eulerMethod(@(t, ~) t^2, tspan, y0, N); % Hardcoded function to t^2
                
                % Display the result
                set(eulerResultText, 'String', num2str(y'));
                
            case 2 % Heat Equation
                disp('Heat Equation solver not implemented yet.');
                
            case 3 % Laplace Equation
                disp('Laplace Equation solver not implemented yet.');
        end
    end
end

function y = eulerMethod(f, tspan, y0, N)
    % Euler method for solving ODEs
    % Inputs:
    %   f: Function handle @(t, y) representing the ODE dy/dt = f(t, y)
    %   tspan: Vector [t0, tf] specifying the initial and final time
    %   y0: Initial condition
    %   N: Number of time steps
    % Output:
    %   y: Vector of solutions
    
    t0 = tspan(1);
    tf = tspan(2);
    h = (tf - t0) / N; % Step size
    t = t0:h:tf; % Time vector
    y = zeros(N+1, 1); % Solution vector
    y(1) = y0; % Initial condition
    
    for i = 1:N
        y(i+1) = y(i) + h * f(t(i), y(i));
    end
end
