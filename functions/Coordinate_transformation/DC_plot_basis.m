function [] = DC_plot_basis(A)
% Origin points (all vectors start from the origin in this example)
origin = zeros(3,3);

% Plot each vector
% Plotting
figure;
hold on;
quiver3(origin(1,:), origin(2,:), origin(3,:), A(1,:), A(2,:), A(3,:), 'AutoScale', 'off');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
grid on;
axis equal;
title('3D Orthogonal Unit Vectors');
hold off;
end

