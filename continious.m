// function [StdYes, StdNo]
YesVector=  zeros(2400, 1);
NoVector = zeros(2400, 1);
for i=1:57
  for j=1:2400
    if LabelSet(j) == 1
      YesVector(j,i) = AttributeSet(j,i);
      YesVector(j,i) = AttributeSet(j,i);
    else
      NoVector(j,i) = AttributeSet(j,i);
      NoVector(j,i) = AttributeSet(j,i);
    end
  end
end

Yescount = 0;
Nocount = 0;

for i=1:2400
  if LabelSet(i) == 1
  Yescount = Yescount + 1;
  else
    Nocount = Nocount + 1;
  end
end


MeanYes = sum(YesVector)/Yescount;
MeanNo = sum(NoVector)/Nocount;

stdValYes = 0;
stdValNo = 0;

for i=1:2400
  if(LabelSet(i) == 1)
  stdValYes = stdValYes + (YesVector(i,1) - MeanYes).^2;
  else
    stdValNo = stdValNo + (NoVector(i,1) - MeanNo).^2;
  end
end

stdValYes = stdValYes / Yescount;
stdValNo = stdValNo / Nocount;

StdYes = sqrt(stdValYes);
StdNo = sqrt(stdValNo);

%StdNo = std(NoVector)/Nocount;
for i = 1:57
  for j = 1:2400
    if(LabelSet(j) == 1)
      prob(i,1) = (1 / ( sqrt(2 * pi) *  StdYes(i)) ) ^ ( -((YesVector(j,i)-MeanYes(i)) ^ 2) / 2*(StdYes(i)^2) );
    else
      prob(i,2) = (1 / ( sqrt(2 * pi) *  StdNo(i))) ^ (-((NoVector(j,i)-MeanNo(i)) ^ 2) / 2*(StdNo(i)^2));
    end
  end
end
