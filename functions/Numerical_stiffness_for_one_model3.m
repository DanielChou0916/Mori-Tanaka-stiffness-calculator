function MT_AllT = Numerical_stiffness_for_one_model3(model_struct,C,c_len,M,N,Gauss_points_weights,model_name)
%% Additional parameter: Pre-calculated Gauss_points_weights
% Compare to previous version which set up M,N in each iteration.
%This version adopt the pre-calculate Gauss points and weights.
%It saves time to large amount calculation.
% Furthermore, it adjusts the aspect ratio manually for the extreme case.
% As the extreme aspect ratio will impact the result significantly, leads
% to unrealistic results.
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
        %%
        allA=principal_vectors.(T_cell{t});
        allsemi=semi_axes.(T_cell{t});
        allellarea=ellispe_areas.(T_cell{t});
        total_area=total_areas.(T_cell{t});
        crack_num=size(allA,1);
        %% Numerical Eshelby tensor for crack
            for p=1:crack_num
                %p=1;%for single crack
                %Principal direction for coordinate transformation
                A=squeeze(allA(p,:,:));
                A3D = [A, [0; 0]; 0, 0, 1];% Broadcast into 3D for general calculation
                %Manipulate the semiaxis
                semi=allsemi(p,:);
                %1e10 for plane strain, 1e-10 for plane stress
                if (semi(1)/semi(2))>2000
                    semi3D=[semi(1),semi(1)/2000,c_len];
                else
                    semi3D=[semi(1),semi(2),c_len];
                end
                %N = 2048;%For extreme shape, N needs to be very large.
                %M = 4;
                [S,P] = Numerical_Eshelby2(C,A3D,semi3D,N,M,Gauss_points_weights);
                Eshelby_structure(p).S=S;
                Eshelby_structure(p).P=P;
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

