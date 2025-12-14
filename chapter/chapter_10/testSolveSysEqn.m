syms u v
eqn1 = 2*u^2 + v^2 == 0;
eqn2 = u - v == 1;
sol = solve(eqn1,eqn2,u,v);
sol.u
sol.v