%  4th order tensor which has minor symmetry, Voigt expression

function R = tensor2matrix2(F)
    F_matrix(1,1) = F(1,1,1,1);
    F_matrix(1,2) = F(1,1,2,2);
    F_matrix(1,3) = F(1,1,3,3);
    F_matrix(1,4) = 1*F(1,1,2,3);
    F_matrix(1,5) = 1*F(1,1,3,1);
    F_matrix(1,6) = 1*F(1,1,1,2);

    F_matrix(2,1) = F(2,2,1,1);
    F_matrix(2,2) = F(2,2,2,2);
    F_matrix(2,3) = F(2,2,3,3);
    F_matrix(2,4) = 1*F(2,2,2,3);
    F_matrix(2,5) = 1*F(2,2,3,1);
    F_matrix(2,6) = 1*F(2,2,1,2);
    
    F_matrix(3,1) = F(3,3,1,1);
    F_matrix(3,2) = F(3,3,2,2);
    F_matrix(3,3) = F(3,3,3,3);
    F_matrix(3,4) = 1*F(3,3,2,3);
    F_matrix(3,5) = 1*F(3,3,3,1);
    F_matrix(3,6) = 1*F(3,3,1,2);
    
    F_matrix(4,1) = 1*F(2,3,1,1);
    F_matrix(4,2) = 1*F(2,3,2,2);
    F_matrix(4,3) = 1*F(2,3,3,3);
    F_matrix(4,4) = 1*1*F(2,3,2,3);
    F_matrix(4,5) = 1*1*F(2,3,3,1);
    F_matrix(4,6) = 1*1*F(2,3,1,2);
    
    F_matrix(5,1) = 1*F(3,1,1,1);
    F_matrix(5,2) = 1*F(3,1,2,2);
    F_matrix(5,3) = 1*F(3,1,3,3);
    F_matrix(5,4) = 1*1*F(3,1,2,3);
    F_matrix(5,5) = 1*1*F(3,1,3,1);
    F_matrix(5,6) = 1*1*F(3,1,1,2);
    
    F_matrix(6,1) = 1*F(1,2,1,1);
    F_matrix(6,2) = 1*F(1,2,2,2);
    F_matrix(6,3) = 1*F(1,2,3,3);
    F_matrix(6,4) = 1*1*F(1,2,2,3);
    F_matrix(6,5) = 1*1*F(1,2,3,1);
    F_matrix(6,6) = 1*1*F(1,2,1,2);
    
  R = F_matrix;
end
            
        
