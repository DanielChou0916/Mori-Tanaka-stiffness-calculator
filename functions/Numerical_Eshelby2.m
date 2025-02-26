function [S,P] = Numerical_Eshelby2(C,A3D,semi3D,N,M,Gauss_points_weights)
%% Additional parameter: Pre-calculated Gauss_points_weights
C_local=transform2local(C,A3D);
P_local = Hill_P2(semi3D, N, M, C_local,Gauss_points_weights);
P=transformBack2Global(P_local,A3D);
S = Eshelby(P, C);
end

