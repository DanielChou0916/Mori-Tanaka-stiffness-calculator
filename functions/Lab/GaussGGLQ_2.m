function Gauss_points_weights = GaussGGLQ_2(M, N)

% Gauss-Legendre method to generate nodes and weights for double
% integration
% Out put: Gauss_points_weights
% The 1st column: The zeta3 variable zeta3_p
% The 2nd column: The omega variable omega_q
% The 3rd column: The joint weights W_pq
%--------------------------------------------------------------------------
[zeta3,w_p] = Gauss(M);
[omega,w_q] = Gauss(N);
% Integration by substitution [-1, 1]: no need to change.
zeta3_p  = zeta3 ;
% Integration by substitution [0, 2*pi]
omega_q = 0.5*(2*pi - 0)*omega + 0.5*(2*pi + 0);

Gauss_points_weights = zeros(M * N, 3);
% Counter for the rows in Gauss_points_weights
counter = 1;
for i = 1:M
    for j = 1:N
        % Fill in the preallocated array
        Gauss_points_weights(counter, :) = [zeta3_p(i), omega_q(j), w_p(i)*w_q(j)];
        counter = counter + 1; % Move to the next row
    end
end

end