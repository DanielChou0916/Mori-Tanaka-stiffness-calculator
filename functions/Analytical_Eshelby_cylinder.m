function S = Analytical_Eshelby_cylinder(A3D,semi3D,nu)
S_local = AnalyticalCylinderS(semi3D,nu);
S=transformBack2Global(S_local,A3D);
end

