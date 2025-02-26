function HillAux = HillAux_func(omega,z3,Wpq, a, Stiffness)
    %Calculate the aux_tensor for each Gauss point by n_ele id
    %Gauss_points_weights:[zeta3,omega,w_pq]
    %Updated version: Directly input Wpq,omega,z3 instead of whole weight
    %matrix and n_ele
    %Wpq=Gauss_points_weights(n_ele,3);
    %omega = Gauss_points_weights(n_ele,2);
    %z3(3) = Gauss_points_weights(n_ele,1);
    Zeta(3) = z3;
    Zeta(1) =(1-Zeta(3)^2)^(1/2) * cos(omega);
    Zeta(2) =(1-Zeta(3)^2)^(1/2) * sin(omega);
    
    Xi = zeros(3, 1);
    for i = 1:3
        Xi(i) = Zeta(i)/a(i);
    end
    K = zeros(3, 3);
    for i = 1:3
        for j = 1:3
            for k = 1:3
                for l = 1:3
                    K (i, k) = K (i, k) + Stiffness (i, j, k, l) * Xi(j) * Xi(l);
                end
            end
        end
    end
    
    D = 0;%Eq 3.9 page 8. eq6.9
    for m = 1:3
        for n = 1:3
            for l = 1:3
                D =  D + LeviCivita([m, n, l]) * K(m, 1) * K(n, 2) * K(l, 3);
            end
        end
    end
    
    N_bar = zeros(3, 3);%Eq 3.9 page 8. eq6.9
    for i = 1:3
        for j = 1:3
            for k = 1:3
                for l = 1:3
                    for m = 1:3
                        for n =1:3
                            N_bar(i, j) = N_bar(i, j) + 1/2 * LeviCivita([i, k, l]) * LeviCivita([j, m, n]) * K(k, m) * K(l, n);
                        end
                    end
                end
            end
        end
    end
    
    Green_f = zeros(3, 3, 3, 3);%5.59 page 34?
    for i = 1:3
        for j = 1:3
            for k = 1:3
                for l = 1:3
                    Green_f(i, j, k, l) = Xi(k) * Xi(l) *N_bar(i, j)/D;
                end
            end
        end
    end
    
    Result= zeros(3, 3, 3, 3);
    for i = 1:3
        for j = 1:3
            for k = 1:3
                for l = 1:3                  
                    Result(i, j, k, l) = Result(i, j, k, l) + (Green_f(i, l, j, k) + Green_f(j, l, i, k));    
                end
            end
        end
    end
    %Integral scale (1/2) * (2*pi-0) is included in Gauss function
    %
    HillAux = 1/(8*pi) * (Result* Wpq);%Gauss_points_weights(n_ele,3));
end