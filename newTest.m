function [predictLabel, expected, accuracy] = newTest(testAttributeSet,validLabel, StdYes, StdNo, MeanYes, MeanNo)
predictLabel = ones(2,size(testAttributeSet,1));
for i=1:size(testAttributeSet,1)
	for j=1:size(testAttributeSet,2)
		predictLabel(1,i) = predictLabel(1,i) * normpdf(testAttributeSet(i, j), MeanYes(j), StdYes(j));
		predictLabel(2,i) = predictLabel(2,i) * normpdf(testAttributeSet(i, j), MeanNo(j), StdNo(j));
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
for i=1:size(validLabel,1)
	if abs(expected(i) - validLabel(i)) < 0.5
		count = count + 1;
	end
end

accuracy = count / size(validLabel,1) * 100;