function MT_AllT = Analytical_stiffness_for_one_model(model_struct,C,nu,model_name)
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
        
        allA=principal_vectors.(T_cell{t});
        allsemi=semi_axes.(T_cell{t});
        allellarea=ellispe_areas.(T_cell{t});
        total_area=total_areas.(T_cell{t});
        crack_num=size(allA,1);
        %% Numerical Eshelby tensor for crack
            parfor p=1:crack_num
                %p=1;%for single crack
                %Principal direction for coordinate transformation
                A=squeeze(allA(p,:,:));
                A3D = [A, [0; 0]; 0, 0, 1];% Broadcast into 3D for general calculation
                semi=allsemi(p,:);
                S_local = AnalyticalCylinderS(semi,nu);
                S=transformBack2Global(S_local,A3D);
                Eshelby_structure(p).S=S;
                Eshelby_structure(p).ellipse_area=allellarea(p);
            end
        %% Calculate the Mori-Tanaka C_hom
        %[C_homMT,C_homMT_matrix]=Mori_Tanaka(C,Eshelby_structure,total_area);
        C2=zeros(3,3,3,3);
        [C_homMT,C_homMT_matrix]=Mori_Tanaka2(C,C2,Eshelby_structure,total_area);
      %% Storing the Homogeneization stiffness
        MT_AllT(t).Chom=C_homMT;
        MT_AllT(t).Chom_matrix=C_homMT_matrix;
        MT_AllT(t).Eshelby_struct=Eshelby_structure;
    end
    delete(f)
end

