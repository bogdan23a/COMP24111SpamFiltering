function [predictLabel, accuracy, expected] = NBTest(Parameters, testAttributeSet, validLabel, LookUpTable, YesProbability, NoProbability, MaybeProbability, maxAttributeNumber, Yes, No)

if MaybeProbability ~= 0
	predictLabel = ones(3, size(testAttributeSet,1));
else
	predictLabel = ones(2,size(testAttributeSet,1));
end

for i = 1:size(testAttributeSet,1)
	if MaybeProbability == 0
		for j=1:size(testAttributeSet,2)
			predictLabel(2,i) = predictLabel(2,i) * LookUpTable(j, 2 * maxAttributeNumber - testAttributeSet(i,j) + 2);
			predictLabel(1,i) = predictLabel(1,i) * LookUpTable(j, maxAttributeNumber - testAttributeSet(i,j) + 1);
		end
	else
		for j=1:size(testAttributeSet,2)
			predictLabel(3,i) = predictLabel(3,i) * LookUpTable(j, 3 * maxAttributeNumber - testAttributeSet(i,j) + 3);
			predictLabel(2,i) = predictLabel(2,i) * LookUpTable(j, 2 * maxAttributeNumber - testAttributeSet(i,j) + 2);
			predictLabel(1,i) = predictLabel(1,i) * LookUpTable(j, maxAttributeNumber - testAttributeSet(i,j) + 1);
		end
	end
	

	if MaybeProbability ~= 0		
		predictLabel(3, i) = predictLabel(3, i)*NoProbability;
		predictLabel(2, i) = predictLabel(2, i)*YesProbability;
		predictLabel(1, i) = predictLabel(1, i)*MaybeProbability;
	else
		predictLabel(2,i) = predictLabel(2,i)*(No / size(testAttributeSet,1));
		predictLabel(1,i) = predictLabel(1,i)*(Yes / size(testAttributeSet,1));
	end
end


for i=1:size(predictLabel,2)
	% expected(i)=1;
	if MaybeProbability ~= 0

		if(predictLabel(3,i) > predictLabel(2,i)) & predictLabel(3,i) > predictLabel(1,i)
			expected(i) = 0;
		elseif predictLabel(2,i) > predictLabel(3,i) & predictLabel(2,i) > predictLabel(1,i)
			expected(i) = 1;
		elseif predictLabel(1,i) > predictLabel(2,i) & predictLabel(1,i) >predictLabel(3,i)
			expected(i) = 2;
		end
				
	else
		 expected(i)=1;
		if predictLabel(2,i) > predictLabel(1,i)
			expected(i) = 0;
		end
	end

end

count=0;
for i=1:size(expected,2)
	if(validLabel(i) == expected(i))
		count=count+1;
	end
end

accuracy=(count/size(expected,2))*100;