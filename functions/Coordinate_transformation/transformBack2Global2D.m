function T_in_org_basis = transformBack2Global2D(T_in_A_basis,A)
    T_in_org_basis=zeros(3,3);
    for i=1:3
        for j=1:3
            for k=1:3
                for l=1:3
                    T_in_org_basis(i,j)=T_in_org_basis(i,j)+...
                        A(k,i)*A(l,j)*T_in_A_basis(k,l);
                end
            end
        end
    end
end

