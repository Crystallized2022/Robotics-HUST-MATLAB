function [rOC_global, rOi_global] = getGlobalCoordinate(rOC_local, pos_mat, rot_mat)
elementNum = size(rot_mat,3);
rOC_global = sym(zeros(3,elementNum));
rOi_global = sym(zeros(3,elementNum));
for i=1:elementNum
    rOC_global(:,i)=rot_mat(:,:,i)*rOC_local(:,i);
    rOi_global(:,i)=pos_mat(:,i) - pos_mat(:,i+1);
end