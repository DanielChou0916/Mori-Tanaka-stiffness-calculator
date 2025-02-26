function [S,P] = Numerical_Eshelby(C,A3D,semi3D,N,M)
C_local=transform2local(C,A3D);
P_local = Hill_P(semi3D, N, M, C_local);
P=transformBack2Global(P_local,A3D);
S = Eshelby(P, C);
end

