% 4th order tensor which has minor symmetries, Mandel notation (Ref, Lee, 2019)

function tensor = matrix2tensor2(matrix)
tensor(1,1,1,1) = matrix(1,1) ;
tensor(1,1,2,2) = matrix(1,2);
tensor(1,1,3,3) = matrix(1,3);
tensor(1,1,2,3) = matrix(1,4)/1;
tensor(1,1,3,1) = matrix(1,5)/1;
tensor(1,1,1,2) = matrix(1,6)/1;
tensor(1,1,3,2) = matrix(1,4)/1;
tensor(1,1,1,3) = matrix(1,5)/1;
tensor(1,1,2,1) = matrix(1,6)/1;

tensor(2,2,1,1) = matrix(2,1);
tensor(2,2,2,2) = matrix(2,2);
tensor(2,2,3,3) = matrix(2,3);
tensor(2,2,2,3) = matrix(2,4)/1;
tensor(2,2,3,1) = matrix(2,5)/1;
tensor(2,2,1,2) = matrix(2,6)/1;
tensor(2,2,3,2) = matrix(2,4)/1;
tensor(2,2,1,3) = matrix(2,5)/1;
tensor(2,2,2,1) = matrix(2,6)/1;


tensor(3,3,1,1) = matrix(3,1);
tensor(3,3,2,2) = matrix(3,2);
tensor(3,3,3,3) =  matrix(3,3);
tensor(3,3,2,3) = matrix(3,4)/1;
tensor(3,3,3,1) = matrix(3,5)/1;
tensor(3,3,1,2) = matrix(3,6)/1;
tensor(3,3,3,2) = matrix(3,4)/1;
tensor(3,3,1,3) = matrix(3,5)/1;
tensor(3,3,2,1) = matrix(3,6)/1;


tensor(2,3,1,1) = matrix(4,1)/1;
tensor(2,3,2,2) = matrix(4,2)/1;
tensor(2,3,3,3) = matrix(4,3)/1;
tensor(2,3,2,3) = matrix(4,4)/1/1;
tensor(2,3,3,1) = matrix(4,5)/1/1;
tensor(2,3,1,2) = matrix(4,6)/1/1;
tensor(2,3,3,2) = matrix(4,4)/1/1;
tensor(2,3,1,3) = matrix(4,5)/1/1;
tensor(2,3,2,1) = matrix(4,6)/1/1;


tensor(3,2,1,1) = matrix(4,1)/1;
tensor(3,2,2,2) = matrix(4,2)/1;
tensor(3,2,3,3) = matrix(4,3)/1;
tensor(3,2,2,3) = matrix(4,4)/1/1;
tensor(3,2,3,1) = matrix(4,5)/1/1;
tensor(3,2,1,2) = matrix(4,6)/1/1;
tensor(3,2,3,2) = matrix(4,4)/1/1;
tensor(3,2,1,3) = matrix(4,5)/1/1;
tensor(3,2,2,1) = matrix(4,6)/1/1;

tensor(3,1,1,1) = matrix(5,1)/1;
tensor(3,1,2,2) = matrix(5,2)/1;
tensor(3,1,3,3) = matrix(5,3)/1;
tensor(3,1,2,3) = matrix(5,4)/1/1;
tensor(3,1,3,1) = matrix(5,5)/1/1;
tensor(3,1,1,2) = matrix(5,6)/1/1;
tensor(3,1,3,2) = matrix(5,4)/1/1;
tensor(3,1,1,3) = matrix(5,5)/1/1;
tensor(3,1,2,1) = matrix(5,6)/1/1;

tensor(1,3,1,1) = matrix(5,1)/1;
tensor(1,3,2,2) = matrix(5,2)/1;
tensor(1,3,3,3) = matrix(5,3)/1;
tensor(1,3,2,3) = matrix(5,4)/1/1;
tensor(1,3,3,1) = matrix(5,5)/1/1;
tensor(1,3,1,2) = matrix(5,6)/1/1;
tensor(1,3,3,2) = matrix(5,4)/1/1;
tensor(1,3,1,3) = matrix(5,5)/1/1;
tensor(1,3,2,1) = matrix(5,6)/1/1;

tensor(1,2,1,1) = matrix(6,1)/1;
tensor(1,2,2,2) = matrix(6,2)/1;
tensor(1,2,3,3) = matrix(6,3)/1;
tensor(1,2,2,3) = matrix(6,4)/1/1;
tensor(1,2,3,1) = matrix(6,5)/1/1;
tensor(1,2,1,2) = matrix(6,6)/1/1;
tensor(1,2,3,2) = matrix(6,4)/1/1;
tensor(1,2,1,3) = matrix(6,5)/1/1;
tensor(1,2,2,1) = matrix(6,6)/1/1;

tensor(2,1,1,1) = matrix(6,1)/1;
tensor(2,1,2,2) = matrix(6,2)/1;
tensor(2,1,3,3) = matrix(6,3)/1;
tensor(2,1,2,3) = matrix(6,4)/1/1;
tensor(2,1,3,1) = matrix(6,5)/1/1;
tensor(2,1,1,2) = matrix(6,6)/1/1;
tensor(2,1,3,2) = matrix(6,4)/1/1;
tensor(2,1,1,3) = matrix(6,5)/1/1;
tensor(2,1,2,1) = matrix(6,6)/1/1;

end



