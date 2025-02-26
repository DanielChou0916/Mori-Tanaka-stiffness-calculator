clear all;close;clc
addpath('C:\Users\user\Desktop\Eshelby_tensor\Eshelby')
N=2;
M=2;
[omega,w_q] = Gauss(N);
[Xi,w_p] = Gauss(M);
% Reshape w_pq into a vector 1X(N X M)
w_pq    = reshape((w_q*w_p'),1,[]);
% Integration by substitution [0, 2*pi]
omega_q = 0.5*(2*pi - 0)*omega + 0.5*(2*pi + 0);
Xi_p  = Xi ;

%%
Alp   = zeros(N, M);
Bet   = zeros(N, M);

for i = 1:N
    for j = 1:M
        Alp(i,j) = omega_q(i);
        Bet(i,j) = Xi_p(j);
    end
end
Alp = reshape(Alp,1,[]);
Bet = reshape(Bet,1,[]);