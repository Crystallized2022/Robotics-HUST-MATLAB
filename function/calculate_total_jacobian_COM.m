function [JT, JR] = calculate_total_jacobian_COM(rOC_global,ang_vel,q)
    elementNum = size(rOC_global,2);
    JT = sym(zeros(3,elementNum,elementNum));
    JR = sym(zeros(3,elementNum,elementNum));
    for i = 1:elementNum
        JT(:,:,i) = jacobian(rOC_global(:,i),q);
        JR(:,:,i) = jacobian(ang_vel(:,i),diff(q));
        JT(:,:,i) = simplify(JT(:,:,i));
        JR(:,:,i) = simplify(JR(:,:,i));
    end
end