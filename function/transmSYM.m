function A = transmSYM(x,y,z)
A = sym(eye(4));
A(1,4) = x;
A(2,4) = y;
A(3,4) = z;
end