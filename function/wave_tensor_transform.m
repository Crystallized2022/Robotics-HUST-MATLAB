function tensor = wave_tensor_transform(vector_mat)
     length = size(vector_mat,2);
     tensor = sym(zeros(3,3,length));
     for i=1:length
         tensor(3,2,i) = vector_mat(1,i);
         tensor(1,3,i) = vector_mat(2,i);
         tensor(2,1,i) = vector_mat(3,i);
         tensor(2,3,i) = -tensor(3,2,i);
         tensor(3,1,i) = -tensor(1,3,i);
         tensor(1,2,i) = -tensor(2,1,i);
     end
end
