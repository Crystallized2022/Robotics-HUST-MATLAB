function C = calculate_coriolis_matrix(M,q)
    dq = diff(q);
    elementNum = size(M,1);
    C = sym(zeros(elementNum));
    for j = 1:elementNum
        for k = 1:elementNum
            for l = 1:elementNum
                dqkj = diff(M(k,j),q(l));
                dqlj = diff(M(l,j),q(k));
                dqkl = diff(M(k,l),q(j));
                C(j,k) = C(j,k) + 1/2*(dqkj+dqlj-dqkl)*dq(l);
            end
        end
    end
    C = simplify(C);
end