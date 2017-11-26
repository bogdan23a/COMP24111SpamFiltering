function [MeanYes, MeanNo, StdYes, StdNo] = new(AttributeSet, LabelSet)
  %{
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

size(Yes)
size(No)

MeanYes = mean(Yes);
MeanNo = mean(No);

StdYes = std(Yes);
StdNo = std(No);

size(StdYes)

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
%}
yes = [];
no = [];

for i = 1:size(AttributeSet,1)
  %for j = 1:size(AttributeSet, 2)
    if abs(LabelSet(i) - 1) < 0.5
      yes = [yes; AttributeSet(i, :)];
    else
      no = [no; AttributeSet(i, :)];
    end;
  %end;
end;

size(yes)
size(no)

MeanYes = mean(yes);
MeanNo = mean(no);
StdYes = std(yes);
StdNo = std(no);

% for i=1:size(transpose(Yes))
%   for j=1:size(Yes)
%     x = 1 / (sqrt(2*pi) * StdYes(i));
%     z = 2*(StdYes(i)^2);
%     y = exp(-((Yes(j,i) - MeanYes(i))^2 )/ z);
%     t = x*y;
%     probYes(j,i) = t;
%   end
% end


% for i=1:size(transpose(No))
%   for j=1:size(No)
%     x = 1 / (sqrt(2*pi) * StdNo(i));
%     z = 2*(StdNo(i)^2);
%     y = exp(-(No(j,i) - MeanNo(i))^2 / z);
%     t = x*y;
%     probNo(j,i) = t;
%   end
% end

%for i=1:57
%  if(prob(1,i) > prob(2,i))
%    probFinal(1,i) = 1;
%  else
%    probFinal(1,i) = 0; 
%  end
%end

