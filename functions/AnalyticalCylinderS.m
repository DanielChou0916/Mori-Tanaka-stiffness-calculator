function S = AnalyticalCylinderS(semi,nu)
%ANALYTICALSPHERES Summary of this function goes here
%   Detailed explanation goes here
% Assume: c is inf, so it is not an effective input for this function
%The input 'semi' is an array
a=semi(1);
b=semi(2);
S= zeros(3, 3, 3 ,3);
S(1,1,1,1) = 1/(2*(1-nu))*( (b^2+2*a*b)/((a+b)^2) + (1-2*nu)*(b/(a+b)) );
S(2,2,2,2) = 1/(2*(1-nu))*( (a^2+2*a*b)/((a+b)^2) + (1-2*nu)*(a/(a+b)) );

S(1,1,2,2) = 1/(2*(1-nu))*( (b^2)/((a+b)^2) - (1-2*nu)*(b/(a+b)) );

S(2,2,3,3) = 1/(2*(1-nu))*( (2*nu*a)/(a+b));

S(2,2,1,1) = 1/(2*(1-nu))*( (a^2)/((a+b)^2) - (1-2*nu)*(a/(a+b)) );

S(1,2,1,2) = 1/(2*(1-nu))*( (a^2+b^2)/(2*(a+b)^2) + ((1-2*nu)/2) );

S(1,1,3,3) = 1/(2*(1-nu))*( (2*nu*b)/(a+b) );

S(2,3,2,3) = a/(2*(a+b));

S(3,1,3,1) = b/(2*(a+b));
tolerance = 1e-10;
% Enforce the symmetry S(i,j,k,l) = S(j,i,k,l) = S(i,j,l,k)
for i = 1:3
    for j = 1:3
        for k = 1:3
            for l = 1:3
                % Check if the current component is non-zero (or larger than tolerance)
                if abs(S(i,j,k,l)) > tolerance
                    % Distribute the value to symmetric components
                    S(j,i,k,l) = S(i,j,k,l); % Symmetry in the first two indices
                    S(i,j,l,k) = S(i,j,k,l); % Symmetry in the last two indices
                    S(j,i,l,k) = S(i,j,k,l); % Symmetry in the first two and last two indices
                end
            end
        end
    end
end
end

