%% In GAUSSGGLQ
clear;clc;close all
%Daniel
Gauss_points_weights = GaussGGLQ_2(3, 2);
%TingTing:
[Alp,Bet,w_pq] = GaussGGLQ(2, 3);

%% Hill_Aux
n_ele=1;
a=[1,0.2,0.2];
%Daniel
omega = Gauss_points_weights(n_ele,2);
Zeta(3) = Gauss_points_weights(n_ele,1);
Zeta(1) =(1-Zeta(3)^2)^(1/2) * cos(omega);
Zeta(2) =(1-Zeta(3)^2)^(1/2) * sin(omega);
Xi=Zeta./a;
%TingTing
%Eq 17.22 page 136
omegat = Alp(n_ele);
Zetat(3) = Bet(n_ele);
Zetat(1) =(1-Zetat(3)^2)^(1/2) * cos(omega);
Zetat(2) =(1-Zetat(3)^2)^(1/2) * sin(omega);
Xit = zeros(3, 1);
for i = 1:3
    Xit(i) = Zetat(i)/a(i);
end
%%
%Daniel

%TingTing

