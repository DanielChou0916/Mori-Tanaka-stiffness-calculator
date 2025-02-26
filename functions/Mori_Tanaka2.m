function [C_homMT,C_homMT_matrix]=Mori_Tanaka2(C,C2,Eshelby_structure,total_area)
%% Version 2: For general case, which takes the inclusion stiffness C2 as input.
%%
I=fourth_order_identity();
%C2=zeros(3,3,3,3);%For crack
c2i=[Eshelby_structure.ellipse_area]/total_area;
c2=sum(c2i);
c1=1-c2;
%%
parfor p=1:length(Eshelby_structure)
    S=Eshelby_structure(p).S;
    %intermediate variable structure
    Cinv=inversegeneral(C);
    SCn1=doubledotff(S,Cinv);
    SCn1NC=doubledotff(SCn1,(C2-C));
    A2Esh=inversegeneral((I+SCn1NC));
    factorialA2Esh=(c2i(p)/c2)*A2Esh;
    intermediate_struct(p).factorialA2Esh=factorialA2Esh;
end
%% BarA2Esh
concatTensors = cat(5, intermediate_struct.factorialA2Esh);
barA2Esh = sum(concatTensors, 5);
%%
intemid=c1*I+c2*barA2Esh;
big_inv_term=inversegeneral(intemid);
barA2=doubledotff(barA2Esh,big_inv_term);
intemid2=doubledotff((C2-C),barA2);
C_homMT=C+c2*intemid2;

C_homMT_matrix=tensor2matrix(C_homMT);
end