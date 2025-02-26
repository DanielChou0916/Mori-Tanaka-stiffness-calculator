function Hill_P = Hill_P2(a, N, M, Stiffness,Gauss_points_weights)
%% Additional parameter: Pre-calculated Gauss_points_weights

%The integrations are given in 
% zeta3={-1,1}
% omega={0,2*pi}
N_ELE = N*M;
%Gauss_points_weights = GaussGGLQ_3(M, N,-1,1,0,2*pi);
Hill_P = zeros(3, 3, 3, 3);

parfor n_ele = 1 : N_ELE
    %oAux(:, :, :, :, n_ele) = HillAux_3(Gauss_points_weights, a, Stiffness, n_ele)
    Wpq = Gauss_points_weights(n_ele,3);
    omega = Gauss_points_weights(n_ele,2);
    z3 = Gauss_points_weights(n_ele,1);
    oAux(:, :, :, :, n_ele) = HillAux_func(omega,z3,Wpq, a, Stiffness)
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




