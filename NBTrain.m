%function [Parameters] = NBTrain(Attributes, Labels)
  for i = 1:2300
    s = 0;
    for j = 1:57
      if LabelSet(i) == AttributeSet(i,j)
        s = s + 1;
      end
    Parameters(i) = s/57;
    end
  end
%end