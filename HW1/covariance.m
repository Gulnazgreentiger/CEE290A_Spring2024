% computing covarience at theta hat assuming sigma is given in part of the
% problem as it did 
% Provided or estimated measurement error variance
% Given Jacobian matrix J
J = [-117.0997, 0.0000;
     -96.5324, 0.4827;
     -61.9750, 0.4648;
     -44.9073, 0.3742;
     -35.1134, 0.3072;
     -28.8019, 0.2592];

% Given variance of the measurement error
sigma_squared = 1e-4;

% Compute the covariance matrix of the parameter estimates
cov_beta = sigma_squared * inv(J.' * J);

% Display the covariance matrix
disp('Covariance matrix of the parameters:');
disp(cov_beta);
