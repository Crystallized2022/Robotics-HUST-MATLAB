% input: 4x4xN transformation from i to 0
% output: [3xN angular velocity vector, 3xN angular acceleration vector]
function [vel, acl] = kinematic_component(pos_vec)
    syms t;
    length = size(pos_vec,2);
    vel = sym(zeros(3, length));
    acl = sym(zeros(3, length));
    for i=1:length
        temp = pos_vec(:,i);
        diff_temp = diff(temp,t);
        vel(1,i) = diff_temp(1);
        vel(2,i) = diff_temp(2);
        vel(3,i) = diff_temp(3);
        acl(1,i) = diff(vel(1,i),t);
        acl(2,i) = diff(vel(2,i),t);
        acl(3,i) = diff(vel(3,i),t);
    end
    vel = simplify(vel);
    acl = simplify(acl);
end

    
    