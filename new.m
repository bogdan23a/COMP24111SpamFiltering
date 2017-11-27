function [MeanYes, MeanNo, StdYes, StdNo] = new(AttributeSet, LabelSet)
  
for i=1:size(AttributeSet,2)
  indexYes = 1;
  indexNo = 1;
  for j=1:size(AttributeSet,1)
    if(abs(LabelSet(j) - 1) < 0.5)
      Yes(indexYes, i) = AttributeSet(j,i);
      indexYes = indexYes + 1;
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


for i=1:size(StdYes,2)
  if StdYes(1, i) == 0 
    StdYes(1, i) = 0.0001;
  end
end
for i=1:size(StdNo,2)
  if StdNo(1, i) == 0
    StdNo(1, i) = 0.0001;
  end
end
