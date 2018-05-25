function out_put = normaliz(p)
p = p';
for i = 1:size(p,2)
    if (max(p(:,i))-min(p(:,i)))~=0
        out_put(i,:) = (p(:,i)-min(p(:,i)))/(max(p(:,i))-min(p(:,i)));
    elseif (max(p(:,i))-min(p(:,i)))==0
         out_put(i,:) = zeros(1,size(p,1));
    end
end