clear;clc;close all
semi3D=[1.5,1.3e-4,1e10];
nu=0.25;
A3D=[1,0,0;0,1,0;0,0,1];
M=4;
N=64;
C=elastic_stiffness(25000,nu);
NS=Numerical_Eshelby(C,A3D,semi3D,N,M);

AS=AnalyticalCylinderS(semi3D,nu);

NS_m=tensor2matrix(NS);
AS_m=tensor2matrix(AS);