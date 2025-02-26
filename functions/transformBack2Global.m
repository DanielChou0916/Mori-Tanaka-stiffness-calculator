function P_org = transformBack2Global(P,A)
    P_org=zeros(3,3,3,3);
    for i=1:3
        for j=1:3
            for k=1:3
                for l=1:3
                    for p=1:3
                        for q=1:3
                            for m=1:3
                                for n=1:3
                                    P_org(i,j,k,l)=P_org(i,j,k,l)+A(m,i)*A(n,j)*A(p,k)*A(q,l)*P(m,n,p,q);
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

