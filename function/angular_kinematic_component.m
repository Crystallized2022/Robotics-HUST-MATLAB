% input: 4x4xN transformation from i to 0
% output: [3xN angular velocity vector, 3xN angular acceleration vector]
function [ang_vel, ang_acl] = angular_kinematic_component(rot_mat)
    syms t;
    length = size(rot_mat,3);
    ang_vel = sym(zeros(3, length));
    ang_acl = sym(zeros(3, length));
    for i=1:length
        temp = rot_mat(:,:,i);
        diff_temp = diff(temp,t);
        angular_velocity_tensor = diff_temp*temp.';
        ang_vel(1,i) = angular_velocity_tensor(3,2);
        ang_vel(2,i) = angular_velocity_tensor(1,3);
        ang_vel(3,i) = angular_velocity_tensor(2,1);
        ang_acl(1,i) = diff(ang_vel(1,i),t);
        ang_acl(2,i) = diff(ang_vel(2,i),t);
        ang_acl(3,i) = diff(ang_vel(3,i),t);
    end
    ang_vel = simplify(ang_vel);
    ang_acl = simplify(ang_acl);
end

    