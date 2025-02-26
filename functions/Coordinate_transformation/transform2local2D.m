function T_in_A_basis = transform2local2D(T,A)
    T_in_A_basis=zeros(3,3);
    for i=1:3
        for j=1:3
            for k=1:3 %Sum index 1
                for l=1:3 %Sum index 2
                    T_in_A_basis(i,j)=T_in_A_basis(i,j)+...
                        A(i,k)*A(j,l)*T(k,l);
                end
            end
        end
    end
end

