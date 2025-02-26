function A = DC_Orthogonal_sets(dim)
%ORTHOGONAL_SETS Summary of this function goes here
%   Detailed explanation goes here

A = rand(3,3);

% Use the 'orth' function to obtain an orthonormal basis
A = orth(A);

% Since 'orth' might return less than 3 vectors if they are linearly dependent,
% ensure that we have 3 vectors
if size(A, 2) < 3
    error('Failed to generate three linearly independent vectors. Try again.');
end
A=A';
end

