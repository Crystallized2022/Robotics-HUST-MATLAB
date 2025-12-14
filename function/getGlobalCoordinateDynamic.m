function rOC_global =  getGlobalCoordinateDynamic(rOC_local, pointmat)
    elementNum = size(pointmat,3);
    rOC_local = [rOC_local; ones(1,elementNum)];
    rOC_global = sym(zeros(4,elementNum));
    for i=1:elementNum
        rOC_global(:,i)=pointmat(:,:,i)*rOC_local(:,i);
    end
    rOC_global = rOC_global(1:3,:);
end