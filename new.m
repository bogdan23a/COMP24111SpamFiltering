
for i=1:57
  indexYes = 1;
  indexNo = 1;
  for j=1:size(LabelSet)
    if(LabelSet(j) == 1)
      Yes(indexYes,i) = AttributeSet(j,i);
      indexYes =indexYes+1;
    else
      No(indexNo, i) = AttributeSet(j,i);
      indexNo = indexNo + 1;
    end
  end
end

MeanYes = mean(Yes);
MeanNo = mean(No);

StdYes = std(Yes);
StdNo = std(No);

for i=1:57
  if StdYes(i) == 0 
    StdYes(i) = 0.0001;
  end
  if StdNo(i) == 0
    StdNo(i) = 0.0001;
  end
end

for i=1:57
  for j=1:size(Yes)
    prob(1,i) = (1 / ( sqrt(2 * pi) *  StdYes(i)) ) * exp( -((Yes(j,i)-MeanYes(i)) ^ 2) / 2*(StdYes(i)^2) );
  end
end


for i=1:57
  for j=1:size(No)
    prob(2,i) = (1 / ( sqrt(2 * pi) *  StdNo(i)) ) * exp( -((No(j,i)-MeanNo(i)) ^ 2) / 2*(StdNo(i)^2) );
  end
end

for i=1:57
  if(prob(1,i) > prob(2,i))
    probFinal(1,i) = 1;
  else
    probFinal(1,i) = 0; 
  end
end

