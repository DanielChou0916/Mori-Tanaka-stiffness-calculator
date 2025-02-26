clear 
close all 
clc

%% define an isotropic elastic stiffness
nu = 0.1;
E= 1E5;

mu = E/(2+2*nu);
lambda=E*nu/(1+nu)/(1-2*nu);

M(1:3,1:3,1:3,1:3) = 0;

for i = 1:3
    for j = 1:3
        for k = 1:3
            for l=1:3
                M(i,j,k,l) = M(i,j,k,l) +...
                    (-1)*nu/E*KronD(i,j)*KronD(k,l) + (1+nu)/2/E*(KronD(i,k)*KronD(j,l)+KronD(i,l)*KronD(j,k));
            end
        end
    end
end
C=elastic_stiffness(E,nu);

I2323=0;
for m =1:3
    for n=1:3
        I2323=I2323+C(2,3,m,n)*M(m,n,2,3);
    end
end

C_=doubledotff(C,fourth_order_identity());
isequal(C,C_)
M_=doubledotff(M,fourth_order_identity());
isequal(M,M_)
