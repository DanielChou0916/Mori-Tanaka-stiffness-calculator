function P = transform2local(P_org,A)
%Transform P_org into A (local)basis
    P=zeros(3,3,3,3);
    for i=1:3
        for j=1:3
            for k=1:3
                for l=1:3
                    for p=1:3
                        for q=1:3
                            for m=1:3
                                for n=1:3
                                    P(i,j,k,l)=P(i,j,k,l)+A(i,m)*A(j,n)*A(k,p)*A(l,q)*P_org(m,n,p,q);
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

