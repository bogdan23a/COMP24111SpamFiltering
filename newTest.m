function [predictLabel, expected, accuracy] = newTest(testAttributeSet,validLabel, StdYes, StdNo, MeanYes, MeanNo)
predictLabel = ones(2,size(testAttributeSet,1));
for i=1:size(testAttributeSet,1)
	for j=1:size(testAttributeSet,2)
		% x=1/sqrt(2*pi)*StdYes(j)
		predictLabel(1,i) = (1 /( sqrt(2*pi) * StdYes(j))) * exp(-((testAttributeSet(i,j) - MeanYes(j))^2)/(2*(StdYes(j)^2)));
		predictLabel(2,i) = (1 /( sqrt(2*pi) * StdNo(j))) * exp(-((testAttributeSet(i,j) - MeanNo(j))^2)/(2*(StdNo(j)^2)));
	end
end


for i=1:size(testAttributeSet,1)
	if predictLabel(1,i) > predictLabel(2,i)
		expected(i) = 1;
	else
		expected(i) = 0;
	end
end

count = 0;
for i=1:size(testAttributeSet,1)
	if expected(i) == validLabel(i)
		count = count + 1;
	end
end

accuracy = count / size(validLabel,1) * 100;