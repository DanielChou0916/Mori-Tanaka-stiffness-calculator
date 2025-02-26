clear;clc;close all
nu = 0.1;
E= 1E5;
C=elastic_stiffness(E,nu);

%semi_axis_len = [1;1;1e-10];%Penny
semi_axis_len = [1;1;1];%Sphere
%A=[1,0,0;0,1,0;0,0,1];
A=[2,2,-1;-1,2,2;2,-1,2]/3;
N = 32;
M = 4;
C_local=transform2local(C,A);
P_local = Hill_P(semi_axis_len, N, M, C_local);

%% First method: Transform P back into orginal system, then S=P:C
P=transformBack2Global(P_local,A);
NS1 = Eshelby(P, C);
%% Second method: Calculate the local Eshelby, then S=transformBack2Glocal(S_local) 
NS_local = Eshelby(P_local, C_local);
NS2=transformBack2Global(NS_local,A);
errorS1S2 = norm(tensor2matrix(NS1 - NS2))/norm(tensor2matrix(NS1));
%% Function testing: Numerical_Eshelby
[NSf,NPf] = Numerical_Eshelby(C,A,semi_axis_len,N,M);
errorf = norm(tensor2matrix(NS1 - NSf))/norm(tensor2matrix(NS1));

errorf2 = norm(tensor2matrix(NS2 - NSf))/norm(tensor2matrix(NS2));
%%
%% Analytical solution (Sphere) (Mura 1987. page 79)
S_sphere_local = AnalyticalSphereS(nu);
S_sphere=transformBack2Global(S_sphere_local,A);
errorSphere1 = norm(tensor2matrix(S_sphere - NS1))/norm(tensor2matrix(S_sphere));
errorSphere2 = norm(tensor2matrix(S_sphere - NS2))/norm(tensor2matrix(S_sphere));
errorSphere_local = norm(tensor2matrix(S_sphere_local - NS_local))/norm(tensor2matrix(S_sphere_local));


%% numerical estimation (Penny shape a=b>>c, c is close to 0)
% S_pen_local= AnalyticalPennyS(semi_axis_len,nu);
% 
% S_pen=transformBack2Global(S_pen_local,A);
% errorPen_local = norm(tensor2matrix(NS_local) - tensor2matrix(S_pen_local))/norm(tensor2matrix(S_pen_local));
% errorPen1 = norm(tensor2matrix(NS1) - tensor2matrix(S_pen))/norm(tensor2matrix(S_pen));
% errorPen2 = norm(tensor2matrix(NS2) - tensor2matrix(S_pen))/norm(tensor2matrix(S_pen));
