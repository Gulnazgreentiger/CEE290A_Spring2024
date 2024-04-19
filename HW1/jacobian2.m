% Optimal parameter values obtained from GN or LM
S_hat = 0.1; % Your optimal value for S
T_hat = 0.5; % Your optimal value for T

% Time vector e
t = [5, 10, 20, 30, 40, 50]; % Vector of time points
Q = 50; % Injected volume in cubic meters
d = 10; % Distance from injection point

% Compute the Jacobian matrix at theta hat
Jacobian_at_theta_hat = jacSlugModel(S_hat, T_hat, t, Q, d);

% Display the Jacobian matrix
disp('The Jacobian matrix at theta hat is:');
disp(Jacobian_at_theta_hat);
% Define your parameters
S = 0.4;  % Storage coefficient
T = 0.6;  % Transmissivity
t = [5, 10, 20, 30, 40, 50];  % Time measurements
Q = 50;   % Volume of water injected
d = 10;   % Distance from injection point

% Compute the Jacobian matrix
Jacobian = jacSlugModel(S, T, t, Q, d);

% Display the Jacobian matrix
disp(Jacobian);
function J = jacSlugModel(S, T, t, Q, d)
    % Number of time points
    n = length(t);

    % Initialize the Jacobian matrix
    J = zeros(n, 2);
    
    % Calculate the Jacobian matrix for each time point
    for i = 1:n
        % Compute the partial derivatives
        dh_dS = -(Q * d^2) / (4 * pi * T^2 * t(i)) * exp(-(d^2 * S) / (4 * T * t(i)));
        dh_dT = (Q / (4 * pi * T^2 * t(i))) * exp(-(d^2 * S) / (4 * T * t(i))) - ...
                (Q * d^2 * S) / (16 * pi * T^3 * t(i)^2) * exp(-(d^2 * S) / (4 * T * t(i)));

        % Fill in the Jacobian matrix
        J(i, :) = [dh_dS, dh_dT];
    end
end

