function [x_upd, P_upd, likelihood] = ekf_update(x_pred, P_pred, z, R)
    % Inputs:
    %   x_pred  - Predicted state [x; y; theta]
    %   P_pred  - Predicted covariance
    %   z       - Measurement [x_meas; y_meas; theta_meas]
    %   R       - Measurement noise covariance

    % Measurement matrix (H)
    H = eye(3);  % Since the measurements are direct readings of [x, y, theta]

    % Measurement prediction
    z_pred = H * x_pred;

    % Innovation (measurement residual)
    y = z - z_pred;

    % Innovation covariance
    S = H * P_pred * H' + R;

    % Kalman gain
    K = P_pred * H' / S;

    % Update the state estimate
    x_upd = x_pred + K * y;

    % Update the covariance
    P_upd = (eye(3) - K * H) * P_pred;

    % Compute likelihood for model probability update
    likelihood = exp(-0.5 * (y' * (S \ y))) / sqrt(det(2 * pi * S));
end
