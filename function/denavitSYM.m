% Input is a DH table
% Output are N-dim matrices of: 
% 1. transformation from i to i-1 coordinate system
% 2. transformation from i to 0 coordinate system
function [DH, pointmat] = denavitSYM(table)
element_num = size(table,1);
DH = sym(zeros(4,4,element_num));
for i = 1:element_num
    DH(:,:,i) = rotmSYM(table(i,1),'z')*transmSYM(0,0,table(i,2))*transmSYM(table(i,3),0,0)*rotmSYM(table(i,4),'x');
    DH(:,:,i) = simplify(DH(:,:,i));
end
pointmat = sym(zeros(4,4,element_num));
for i=1:element_num
    pointmat(:,:,i) = sym(eye(4));
    for j=i:-1:1
        pointmat(:,:,i)=DH(:,:,j)*pointmat(:,:,i);
    end
    pointmat(:,:,i)=simplify(pointmat(:,:,i));
end
end
