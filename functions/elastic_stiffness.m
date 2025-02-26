function C = elastic_stiffness(E,nu)
mu = E/(2+2*nu);
lambda=E*nu/(1+nu)/(1-2*nu);
C(1:3,1:3,1:3,1:3) = 0;

for i = 1:3
    for j = 1:3
        for k = 1:3
            for l=1:3
                C(i,j,k,l) = C(i,j,k,l) +...
                    lambda*KronD(i,j)*KronD(k,l) + mu*(KronD(i,k)*KronD(j,l)+KronD(i,l)*KronD(j,k));
            end
        end
    end
end
end

