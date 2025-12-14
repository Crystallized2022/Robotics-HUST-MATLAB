% Input: DH table
% Output: all possible DH matrices, counting duplicates/inverse, organized
% into a elementNum+1 x elementNum+1 cell
% Note that this function should only be used to demonstrate DH matrices
function DH = getAllDHMatrices(table)
elementNum = size(table,1);
% Initialize cell
DH = cell(elementNum+1,elementNum+1);
for i=1:elementNum+1
    for j=1:elementNum+1
        if (j==i+1)
            DH{i,j} = simplify(rotmSYM(table(i,1),'z')*transmSYM(0,0,table(i,2))*transmSYM(table(i,3),0,0)*rotmSYM(table(i,4),'x'));
        else
            DH{i,j} = sym(eye(4,4));
        end
    end
end
% Algorithm to calculate jAi
for i = 3:elementNum+1
   for j = 1:(i-2)
       for k = i:-1:j+1
           DH{j,i} = simplify(DH{k-1,k}* DH{j,i});
       end
   end
end
% Inverses of the above matrices == iAj
for i = 2:elementNum+1
    for j = 1:i-1
        DH{i,j} = simplify(DH{j,i}^(-1));
    end
end
% Display result
for i = 1:elementNum+1
    for j = 1:elementNum+1
        fprintf("DH %dA%d\n", i-1, j-1);
        disp(DH{i,j});
    end
end
end
