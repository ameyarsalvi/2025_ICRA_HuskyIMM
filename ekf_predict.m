function [x_pred, P_pred] = ekf_predict(x, P, K_i, M_i, u1, u2, dt, Q)
    % Inputs:
    %   x    - Current state [x; y; theta]
    %   P    - Current covariance
    %   K_i  - Model parameter (K for model i)
    %   M_i  - Model parameter (M for model i)
    %   u1   - Control input u1
    %   u2   - Control input u2
    %   dt   - Time step
    %   Q    - Process noise covariance

    % Extract current states
    theta = x(3);  % Current orientation
    
    % State transition function (non-linear dynamics)
    % Calculate the state derivatives
    f_x = [
        K_i * u1 * cos(theta);  % x_dot
        K_i * u1 * sin(theta);  % y_dot
        M_i * u2                % theta_dot
    ];
    
    % Predict the next state using the state transition equation
    x_pred = x + f_x * dt;

    % Jacobian of the state transition function (F = df/dx)
    F = [
        0, 0, -K_i * u1 * sin(theta);  % Partial derivatives w.r.t x, y, and theta
        0, 0,  K_i * u1 * cos(theta);
        0, 0, 0
    ];

    % Predict the covariance using the Jacobian
    P_pred = F * P * F' + Q;
end
