function Gauss_points_weights = CCLQ(M, N, a, b, c, d)
%% Do not use this, it's not accurate for Eshelby Tensor for the most of cases.
% Generate nodes and weights for double integration
% Out put: Gauss_points_weights (M * N, 3)
% The 1st column: The variable x_p within integration range {a,b}
% The 2nd column: The variable x_q within integration range {c,d}
% The 3rd column: The joint weights W_pq accounting integral ranges.
%--------------------------------------------------------------------------
%[x_p,w_p] = Gauss_3(M,a,b);
[x_p,w_p] = fclencurt(M,a,b);
[y_q,w_q] = fclencurt(N,c,d);
%[y_q,w_q] = Gauss_3(N,c,d);
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