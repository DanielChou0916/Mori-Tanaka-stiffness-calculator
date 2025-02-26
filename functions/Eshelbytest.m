clear 
close all 
clc

%% define an isotropic elastic stiffness
nu = 0.1;
E= 1E5;

mu = E/(2+2*nu);
lambda=E*nu/(1+nu)/(1-2*nu);

Mac_compliance(1:3,1:3,1:3,1:3) = 0;

for i = 1:3
    for j = 1:3
        for k = 1:3
            for l=1:3
                Mac_compliance(i,j,k,l) = Mac_compliance(i,j,k,l) +...
                    (-1)*nu/E*KronD(i,j)*KronD(k,l) + (1+nu)/2/E*(KronD(i,k)*KronD(j,l)+KronD(i,l)*KronD(j,k));
            end
        end
    end
end
C=elastic_stiffness(E,nu);
Stiffness = inversegeneral(Mac_compliance);

%% numerical estimation (Sphere)
a = [1;1;1]; % sphere

N = 16;
M = 4;
P = Hill_P(a, N, M, Stiffness);
NumEshelby = Eshelby(P, Stiffness);

%% Analytical solution (Sphere) (Mura 1987. page 79)
AnaEshelby = zeros(3, 3, 3 ,3);
AnaEshelby(1,1,1,1) = (7 - 5*nu)/15/(1-nu);
AnaEshelby(2,2,2,2) = (7 - 5*nu)/15/(1-nu);
AnaEshelby(3,3,3,3) = (7 - 5*nu)/15/(1-nu);

AnaEshelby(1,1,2,2) = (5*nu - 1)/15/(1-nu);
AnaEshelby(2,2,3,3) = (5*nu - 1)/15/(1-nu);
AnaEshelby(3,3,1,1) = (5*nu - 1)/15/(1-nu);
AnaEshelby(1,1,3,3) = (5*nu - 1)/15/(1-nu);
AnaEshelby(2,2,1,1) = (5*nu - 1)/15/(1-nu);
AnaEshelby(3,3,2,2) = (5*nu - 1)/15/(1-nu);

AnaEshelby(1,2,1,2) = (4 - 5*nu)/15/(1-nu);
AnaEshelby(2,3,2,3) = (4 - 5*nu)/15/(1-nu);
AnaEshelby(3,1,3,1) = (4 - 5*nu)/15/(1-nu);

RealError = norm(tensor2matrix(AnaEshelby - NumEshelby))/norm(tensor2matrix(AnaEshelby));

%% numerical estimation (Penny shape a=b>>c, c is close to 0)
a_ = [1;1;1e-10]; % sphere
a=a_(1);
b=a_(2);
c=a_(3);

N = 16;
M = 4;
P_pen = Hill_P(a_, N, M, Stiffness);
NumEshelby_pen = Eshelby(P_pen, Stiffness);

%% Analytical solution (Penny shape a=b>>c, c is close to 0) (Chris 2005 Lecture notes , page 37,38)
AnaEshelby_pen = zeros(3, 3, 3 ,3);
AnaEshelby_pen(1,1,1,1) = ( pi*(13-8*nu)*c )/(32*(1-nu)*a);
AnaEshelby_pen(2,2,2,2) = ( pi*(13-8*nu)*c) /(32*(1-nu)*a);

AnaEshelby_pen(3,3,3,3) = 1-( pi*(1 - 2*nu)*c )/( 4*(1-nu)*a );

AnaEshelby_pen(1,1,2,2) = ( pi*(8*nu-1)*c )/(32*(1-nu)*a);
AnaEshelby_pen(2,2,1,1) = ( pi*(8*nu-1)*c )/(32*(1-nu)*a);

AnaEshelby_pen(1,1,3,3) = ( pi*(2*nu-1)*c )/(8*(1-nu)*a);
AnaEshelby_pen(2,2,3,3) = ( pi*(2*nu-1)*c )/(8*(1-nu)*a);

AnaEshelby_pen(3,3,1,1) = ( nu/(1-nu) )*( 1-( pi*(4*nu+1)*c )/( 8*nu*a ) );
AnaEshelby_pen(3,3,2,2) = ( nu/(1-nu) )*( 1-( pi*(4*nu+1)*c )/( 8*nu*a ) );

AnaEshelby_pen(1,2,1,2) = ( pi*(7-8*nu)*c )/(32*(1-nu)*a);

AnaEshelby_pen(3,1,3,1) = 0.5* ( 1+( pi*(nu-2)*c )/( 4*(1-nu)*a ) );
AnaEshelby_pen(2,3,2,3) = 0.5* ( 1+( pi*(nu-2)*c )/( 4*(1-nu)*a ) );


RealError_pen = norm(tensor2matrix(AnaEshelby_pen - NumEshelby_pen))/norm(tensor2matrix(AnaEshelby_pen));

