clear;clc;close all
%% Problem taken from Mase Continuum Mechanics For Engineers(3rd edition): problem 3.10
%A is the basis of another coordinate system
%Each row in A is a axis unit vector.
%A(i,j): i is the A basis index, j is the original basis index
A=[2,2,-1;-1,2,2;2,-1,2]/3;
%DC_plot_basis(A);
%% For the second order tensor
T=[3,0,6;0,0,0;6,0,-3];

%% Transform a T into the A basis: Eq 2.64 page 28
% Suppose we have a matrix in original basis
% The expression of it in A basis is calculated as follows:
T_in_A_basis=zeros(3,3);
for i=1:3
    for j=1:3
        for k=1:3 %Sum index 1
            for l=1:3 %Sum index 2
                T_in_A_basis(i,j)=T_in_A_basis(i,j)+...
                    A(i,k)*A(j,l)*T(k,l);
            end
        end
    end
end
T_a=transform2local2D(T,A);%Function test
error1=norm(A*T*A'-T_in_A_basis);
errorf1=norm(T_a-A*T*A');
%% Transform T_in_A_basis back to the original basis Eq 2.63 page 28
T_in_org_basis=zeros(3,3);
%A_=A'
for i=1:3
    for j=1:3
        for k=1:3
            for l=1:3
                T_in_org_basis(i,j)=T_in_org_basis(i,j)+...
                    A(k,i)*A(l,j)*T_in_A_basis(k,l);
            end
        end
    end
end
T_ab=transformBack2Global2D(T_in_A_basis,A);
%% Check the transormation is correct
error2=norm(T_in_org_basis-T);
errorf2=norm(T_ab-T);
%% Notes
%Once the basis is defined as presented, we have two scenario:
%Recall: A(i,j), i for A basis and j for original basis
%1. Express an object in oroginal space in terms of A basis
%Obj_{The A basis indices} =A_{A_basis,Original} Obj_{Original basis indices}
% T'_ij=A_ik A_jl T_kl
%2. Express an object which is initially defined in A_basis in original
%space
% Obj_{Original basis indices} =A_{A_basis,Original} Obj_{A basis indices}
% T_ij=A_ki A_lj T'_kl
%% 4th order tensor
% For the Hill P tensor which is defined in the local coordinate system A.
% Transforming it back to global system will use the equation:
% P_org=zeros(3,3,3,3)
% P_org(i,j,k,l)=P_org(i,j,k,l)+A(m,i)*A(n,j)*A(p,k)*A(q,l)*P(m,n,p,q)
%% The loop number is 2 times order of the tensor, e.g., T is 2ed order=> 4 for loop.
% So, P is 4th order=> 8 for loop.


