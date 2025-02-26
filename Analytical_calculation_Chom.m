%test for load python dict
clear;clc;close all
addpath 'functions/'

%% Material parameters and elastic stiffness
E=25000; %MPa
nu=0.25;
C=elastic_stiffness(E,nu);
%% Domain profile here: two cracks case
angles2=[0,30,60,90];
c_len=1e10;
C2=zeros(3,3,3,3);
for k =1:length(angles2)
theta2=angles2(k);

%% 
theta=0;
n1=[cos(theta/180*pi),cos((90-theta)/180*pi);cos((90+theta)/180*pi),cos(theta/180*pi)];
n2=[cos(theta2/180*pi),cos((90-theta2)/180*pi);cos((90+theta2)/180*pi),cos(theta2/180*pi)];
allA=cat(3,n1,n2);
allsemi=[27,1.5;15,1];
allellarea=prod(allsemi,2)*pi;
total_area=100*100;
crack_num=2;

%%
for p=1:crack_num
    %p=1;%for single crack
    %Principal direction for coordinate transformation
    A=squeeze(allA(:,:,p));
    A3D = [A, [0; 0]; 0, 0, 1];% Broadcast into 3D for general calculation
    semi=allsemi(p,:);
    semi3D=[semi,c_len]; %1e10 for plane strain, 1e-10 for plane stress
    S = Analytical_Eshelby_cylinder(A3D,semi3D,nu)
    Eshelby_structure(p).S=S;
    %Eshelby_structure(p).P=P;
    Eshelby_structure(p).ellipse_area=allellarea(p);
end
%%
[C_homMT,C_homMT_matrix]=Mori_Tanaka2(C,C2,Eshelby_structure,total_area);
Chom_voigt=tensor2matrix2(C_homMT);
Chom_voigtPlaneStrain=Chom_voigt([1:3,end],[1:3,end]);
Analytical_Mori_Tanaka_stiffness(k).angle=theta2;
Analytical_Mori_Tanaka_stiffness(k).C_homMT=C_homMT;
Analytical_Mori_Tanaka_stiffness(k).C_homMT_matrix=C_homMT_matrix;
Analytical_Mori_Tanaka_stiffness(k).Chom_voigt=Chom_voigt;
Analytical_Mori_Tanaka_stiffness(k).Chom_voigtPlaneStrain=Chom_voigtPlaneStrain;

end
save('Analytical_Mori_Tanaka_stiffness.mat','Analytical_Mori_Tanaka_stiffness');
%%
clear;clc;close all
%%