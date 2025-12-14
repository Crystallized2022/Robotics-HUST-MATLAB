function M = calculate_mass_matrix(m, JT, JR, rot_mat, IC)
    elementNum = size(rot_mat,3);
    M = zeros(elementNum);
    for i=1:elementNum
        M = M + (JT(:,:,i).'*m(i)*JT(:,:,i) + JR(:,:,i).'*rot_mat(:,:,i)*IC(:,:,i)*rot_mat(:,:,i).'*JR(:,:,i));
    end
    M = simplify(M);
end