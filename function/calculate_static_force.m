% Input: force at EE, gravity, mass, rot_mat, rotational tensor for rOC and
% rOi, rho (joint type)
% Output: reaction_force and motor_force
function [reaction_force, motor_force] = calculate_static_force(EEforce, gravity, m, rOC_global_tensor, rOi_global_tensor, rot_mat, rho)
    elementNum = size(rot_mat,3)-1;
    reaction_force = sym(zeros(6,elementNum+1));
    reaction_force(:,elementNum+1) = -EEforce; % Reaction force at EE, 
                                               % coordinate system 0
    motor_force = sym(zeros(elementNum,1)); % Force/moment in motors
    for i = elementNum:-1:1
        reaction_force(1:3,i) = reaction_force(1:3,i+1) - m(i)*gravity;
        reaction_force(4:6,i) = reaction_force(4:6,i+1) - rOC_global_tensor(:,:,i)*m(i)*gravity - rOi_global_tensor(:,:,i)*reaction_force(1:3,i);
        if rho(i) == 1
            motor_force(i) = reaction_force(4:6,i).'*rot_mat(:,3,i);
        elseif rho(i) == 0
            motor_force(i) = reaction_force(1:3,i).'*rot_mat(:,3,i);
        end
    end
    reaction_force = simplify(reaction_force);
    motor_force = simplify(motor_force);
end
