function S = AnalyticalSphereS(nu)
%ANALYTICALSPHERES Summary of this function goes here
%   Detailed explanation goes here
    S= zeros(3, 3, 3 ,3);
    for i = 1:3
        for j = 1:3
            for k = 1:3
                for l = 1:3
                    S(i,j,k,l)=(5*nu - 1)/15/(1-nu)*(KronD(i,j)*KronD(k,l))+...
                        (4 - 5*nu)/15/(1-nu)*(KronD(i,k)*KronD(j,l)+KronD(i,l)*KronD(j,k));
                end
            end
        end
    end
end

