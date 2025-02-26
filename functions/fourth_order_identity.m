function I = fourth_order_identity()
    I = zeros(3,3,3,3); % Initialize the tensor
    for i = 1:3
        for j = 1:3
            for k = 1:3
                for l = 1:3
                    %I(i,j,k,l) = (i == k) * (j == l); 
                    I(i,j,k,l) =0.5*((i == k) * (j == l)+(i == l) * (j == k));% Using MATLAB's == operator
                end
            end
        end
    end
end


