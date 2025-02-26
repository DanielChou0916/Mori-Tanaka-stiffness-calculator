clear;clc;close all
%A is the basis of another coordinate system
%Each row in A is a axis unit vector.
%A(i,j): i is the A basis index, j is the original basis index
dim=3;
A=DC_Orthogonal_sets(dim);
DC_plot_basis(A);
%% For the first order vector
n1=A(1,:);
n1_in_A_basis=zeros(1,3);
%% Transform a n1_vector into the A basis
% Suppose we have a vector in original basis which is in the first axis
% direction of A basis, transform n1 into A should leads to [1,0,0]
for i=1:3
    for j=1:3
%A*n1'
        n1_in_A_basis(i)=n1_in_A_basis(i)+A(i,j)*n1(j);
    end
end

%% Transform n1_in_A_basis back
% Suppose we have a vector defined in A basis, we want to transform it
% back into the original basis.
n1_in_org_basis=zeros(1,3);
%A_=A'
for i=1:3
    for j=1:3
        n1_in_org_basis(i)=n1_in_org_basis(i)+A(j,i)*n1_in_A_basis(j);
    end
end
%% Check the transormation is correct
error=norm(n1_in_org_basis-n1)