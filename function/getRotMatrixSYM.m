% input: 4x4xN transformation from i to 0
% output: 3x3xN rotation matrix 
function rot_mat = getRotMatrixSYM(pointmat)
    length = size(pointmat,2);
    rot_mat = zeros(3,3,length);
    for i = 1:length
        rot_mat(:,:,i) = pointmat(1:3,1:3,i);
    end
end
