function [predictLabel, expected, accuracy] = newTest(testAttributeSet,validLabel, StdYes, StdNo, MeanYes, MeanNo)
predictLabel = ones(2,size(testAttributeSet,1));
for i=1:size(testAttributeSet,1)
	for j=1:size(testAttributeSet,2)
		if StdYes(j) == 0
			StdYes(j) = 0.00001;
		end;

		if StdNo(j) == 0
			StdNo(j) = 0.00001;
		end;
		% x=1/sqrt(2*pi)*StdYes(j)
		%predictLabel(1,i) = (1 /( sqrt(2*pi) * StdYes(j))) * exp(-((testAttributeSet(i,j) - MeanYes(j))^2)/(2*(StdYes(j)^2)));
		%predictLabel(2,i) = (1 /( sqrt(2*pi) * StdNo(j))) * exp(-((testAttributeSet(i,j) - MeanNo(j))^2)/(2*(StdNo(j)^2)));
		predictLabel(1,i) = predictLabel(1,i) * normpdf(testAttributeSet(i, j), MeanYes(j), StdYes(j));
		predictLabel(2,i) = predictLabel(2,i) * normpdf(testAttributeSet(i, j), MeanNo(j), StdNo(j));
	end
end


for i=1:size(testAttributeSet,1)
	%fprintf('%f / %f\n', predictLabel(1,i), predictLabel(2,i));
	if predictLabel(1,i) > predictLabel(2,i)
		expected(i) = 1;
	else
		expected(i) = 0;
	end
	%fprintf('%d / %d\n', expected(i), validLabel(i));
end

count = 0;
for i=1:size(validLabel,1)
	if abs(expected(i) - validLabel(i)) < 0.5
		count = count + 1;
	end
end

accuracy = count / size(validLabel,1) * 100;