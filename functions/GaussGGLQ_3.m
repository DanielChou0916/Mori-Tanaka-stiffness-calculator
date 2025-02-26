function Gauss_points_weights = GaussGGLQ_3(M, N, a, b, c, d)
% Gauss-Legendre method to generate nodes and weights for double
% integration
% Out put: Gauss_points_weights (M * N, 3)
% The 1st column: The variable x_p within integration range {a,b}
% The 2nd column: The variable x_q within integration range {c,d}
% The 3rd column: The joint weights W_pq accounting integral ranges.
%--------------------------------------------------------------------------
[x_p,w_p] = Gauss_3(M,a,b);
[y_q,w_q] = Gauss_3(N,c,d);
Gauss_points_weights = zeros(M * N, 3);
% Counter for the rows in Gauss_points_weights
counter = 1;
for i = 1:M
    for j = 1:N
        % Fill in the preallocated array
        Gauss_points_weights(counter, :) = [x_p(i), y_q(j), w_p(i)*w_q(j)];
        counter = counter + 1; % Move to the next row
    end
end

end