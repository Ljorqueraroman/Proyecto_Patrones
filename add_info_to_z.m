%t es el contador de las filas
function [Z] = add_info_to_z(I, t, options, face_landmarks, Z)
    [X,Xn,op] = Bfx_lbp(I,options);
    J = op.Ilbp;
    %padding para no salirse de la imagen
    J_padd = padarray(J,12);
    J_padd = padarray(J_padd',12);
    J_padd = J_padd';
    for i=1:face_landmarks
        fl = face_landmarks(i,:);
        a1 = fl(1)-12;
        a2 = fl(2)-12;
        a3 = fl(1)+11;
        a4 = fl(2)+11;
        box = J_padd(a1:a3;a2:a4);
        t = t+1;
        Z(t,:) = Bfx_lbpi(box,options);
    end
end