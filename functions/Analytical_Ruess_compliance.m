function R_AllT = Analytical_Ruess_compliance(model_struct,S,model_name)
%% Assume elliptic cylinder c is inf
%%
%For 2D FEM model, the c is the variable of the semi-axis len in z
%direction, which need to do experiments for determination!
    f = waitbar(0,'1','Name',model_name,...
        'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
    principal_vectors=model_struct.principal_vectors;
    semi_axes=model_struct.semi_lengths;
    %ellispe_areas=model_struct.ellipse_area;
    ellispe_areas=model_struct.vertices_area;
    total_areas=model_struct.total_area;
    T_cell=fieldnames(principal_vectors);
    T_cell=sortCellByEmbeddedNumber(T_cell);%Ensure that it's in the correct order
    % Time: 
    for t=1:length(T_cell)
        %t=1;
        waitbar(t/20,f,sprintf('%12d',t))
        allellarea=ellispe_areas.(T_cell{t});
        total_area=total_areas.(T_cell{t});
        c2=sum(allellarea)/total_area;
        c1=1-c2;
        disp(c1);
        %% Calculate the Mori-Tanaka C_hom
        %[C_homMT,C_homMT_matrix]=Mori_Tanaka(C,Eshelby_structure,total_area);
        S2=zeros(3,3,3,3);
        S_homR=c1*S+c2*S2;
      %% Storing the Homogeneization stiffness
        C_homR=inversegeneral(S_homR);
        R_AllT(t).Chom=C_homR;
        R_AllT(t).Chom_matrix=tensor2matrix(C_homR);
    end
    delete(f)
end

