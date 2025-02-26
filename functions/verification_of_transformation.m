clear;clc;close all
%%
nu = 0.1;
E= 1E5;
C=elastic_stiffness(E,nu);
A=[2,2,-1;-1,2,2;2,-1,2]/3;

C_local=transform2local(C,A);

C_back=transformBack2Global(C_local,A);

error=norm(tensor2matrix(C_back - C))/norm(tensor2matrix(C));