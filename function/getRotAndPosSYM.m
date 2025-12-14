% input: 4x4xN transformation from i to 0
% output: [3x3xN rotation matrix, 3xN position vector]
function [rot_mat, pos_vec] = getRotAndPosSYM(pointmat)
    length = size(pointmat,3);
    rot_mat = sym(zeros(3,3,length));
    pos_vec = sym(zeros(3,length));
    rot_mat(:,:,1) = sym(eye(3));
    pos_vec(:,1) = sym(zeros(3,1));
    for i = 1:length
        rot_mat(:,:,i) = pointmat(1:3,1:3,i);
        pos_vec(:,i) = pointmat(1:3,4,i);
    end
end
