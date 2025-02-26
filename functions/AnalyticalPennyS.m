function S = AnalyticalPennyS(semi_axis_len,nu)
%ANALYTICALPENNYS Summary of this function goes here
%   Detailed explanation goes here
a=semi_axis_len(1);
b=semi_axis_len(2);
c=semi_axis_len(3);
S = zeros(3, 3, 3 ,3);
S(1,1,1,1) = ( pi*(13-8*nu)*c )/(32*(1-nu)*a);
S(2,2,2,2) = ( pi*(13-8*nu)*c) /(32*(1-nu)*a);

S(3,3,3,3) = 1-( pi*(1 - 2*nu)*c )/( 4*(1-nu)*a );

S(1,1,2,2) = ( pi*(8*nu-1)*c )/(32*(1-nu)*a);
S(2,2,1,1) = ( pi*(8*nu-1)*c )/(32*(1-nu)*a);

S(1,1,3,3) = ( pi*(2*nu-1)*c )/(8*(1-nu)*a);
S(2,2,3,3) = ( pi*(2*nu-1)*c )/(8*(1-nu)*a);

S(3,3,1,1) = ( nu/(1-nu) )*( 1-( pi*(4*nu+1)*c )/( 8*nu*a ) );
S(3,3,2,2) = ( nu/(1-nu) )*( 1-( pi*(4*nu+1)*c )/( 8*nu*a ) );

S(1,2,1,2) = ( pi*(7-8*nu)*c )/(32*(1-nu)*a);

S(3,1,3,1) = 0.5* ( 1+( pi*(nu-2)*c )/( 4*(1-nu)*a ) );
S(2,3,2,3) = 0.5* ( 1+( pi*(nu-2)*c )/( 4*(1-nu)*a ) );

%Define a small tolerance to account for floating-point precision
tolerance = 1e-10;

% Enforce the symmetry S(i,j,k,l) = S(j,i,k,l) = S(i,j,l,k)
fprintf('Check symmetric')
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

