function G = calculate_gravity_matrix(m, gravity, JT)
    elementNum = size(JT,3);
    G = zeros(elementNum,1);
    for i=1:elementNum
        G = G - m(i)*JT(:,:,i).'*gravity;
    end
    G = simplify(G);
end