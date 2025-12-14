% input: 4x4xN transformation from i to 0
% output: 
function pos_vec = getPosVectorSYM(pointmat)
    length = size(pointmat,2);
    pos_vec = sym(zeros(3,length));
    for i = 1:length
        pos_vec(:,i) = pointmat(1:3,4,i);
    end
end