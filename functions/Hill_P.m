function Hill_P = Hill_P(a, N, M, Stiffness)
%The integrations are given in 
% zeta3={-1,1}
% omega={0,2*pi}
N_ELE = N*M;
%[Alp, Bet, w_pq] = GaussGGLQ(N, M);
%Gauss_points_weights = GaussGGLQ_2(M, N);
Gauss_points_weights = GaussGGLQ_3(M, N,-1,1,0,2*pi);
Hill_P = zeros(3, 3, 3, 3);

parfor n_ele = 1 : N_ELE
    %oAux(:, :, :, :, n_ele) =  HillAux(Alp, Bet, w_pq, a, Stiffness, n_ele);
    %oAux(:, :, :, :, n_ele) = HillAux_2(Gauss_points_weights, a, Stiffness, n_ele)
    oAux(:, :, :, :, n_ele) = HillAux_3(Gauss_points_weights, a, Stiffness, n_ele)
end
 
Aux = sum(oAux, 5);

for i = 1:3
    for j = 1:3
        for k = 1:3
            for l = 1:3
                Hill_P(i, j, k, l) = Hill_P(i, j, k, l) + 1/2 * (Aux(i, j, k, l) + Aux(i, j, l, k));
                %Hill_P(i, j, k, l) = Hill_P(i, j, k, l) + Aux(i, j, k, l)
            end
        end
    end
end
end




