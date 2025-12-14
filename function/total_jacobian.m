% Input: Position and angular velocity of end effector in xyz0
% Output: Translation and rotation Jacobian of end effector
function [JT, JR] = total_jacobian(ang_vel,pos_vec,q)
    syms t;
    JT = simplify(jacobian(pos_vec,q));
    JR = simplify(jacobian(ang_vel, diff(q,t)));
end