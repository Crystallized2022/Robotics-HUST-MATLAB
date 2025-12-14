function [compliance_mat, stiffness_mat1, stiffness_mat2] = calculate_compliance_matrix(k, q, pos_mat)
    Chi_mat = diag(k);

    JT = jacobian(pos_mat(1:2,end),q);
    compliance_mat = JT * Chi_mat^(-1) *JT.';
    compliance_mat = simplify(compliance_mat);
    stiffness_mat1 = compliance_mat^-1; % Might not exist
    stiffness_mat1 = simplify(stiffness_mat1);
    if size(JT,1)==size(JT,2)
        stiffness_mat2 = (JT^-1).' * Chi_mat * (JT^-1); % Might not exist
        stiffness_mat2 = simplify(stiffness_mat2);
    else
        disp("Cannot calculate stiffness matrix 2")
        stiffness_mat2 = 0;
    end
end