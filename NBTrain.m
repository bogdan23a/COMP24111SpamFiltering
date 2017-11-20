%
%Setup variables
%
maxAttributeNumber = 2;




Yes=0;
for i = 1:2300
	Yes = Yes + LabelSet(i);
end
No = 2300 - Yes;

%
%P(Yes),P(No)
%
YesProbability = Yes / 2300;
NoProbability = No / 2300;

%
%Count each feature in each classification
%For each one of the 57 features i have to 
%count both the 1's and 0's for 
%

%numOfClasses = 2;

Parameters = zeros(57,(maxAttributeNumber + 1)*2);

for i = 1:57
  currentAttributeNumber = maxAttributeNumber;
  while currentAttributeNumber >= 0
	  for j = 1:2300
	  	if LabelSet(j) == 1
	  	  
	  	  if(AttributeSet(j,i) == currentAttributeNumber)
	  	  	Parameters(i, maxAttributeNumber - currentAttributeNumber + 1) = Parameters(i, maxAttributeNumber - currentAttributeNumber + 1) + 1;
	  	  end
	   	else
	   	  if(AttributeSet(j,i) == currentAttributeNumber)
	  	  	Parameters(i, 2 * maxAttributeNumber - currentAttributeNumber + 2) = Parameters(i, 2 * maxAttributeNumber - currentAttributeNumber + 2) + 1;
	  	  end
		end
	  end
	  currentAttributeNumber = currentAttributeNumber - 1;
  end

end


LookUpTable = zeros(57,(maxAttributeNumber + 1)*2);
for i=1:57
	%for j=1:maxAttributeNumber+1
	%	LookUpTable(i,j) = Parameters(i,j)/Yes;
	%end
	%for j=maxAttributeNumber+2,(maxAttributeNumber + 1)*2
		%LookUpTable(i,j) = Parameters(i,j)/No;
	%	LookUpTable(i,j) = 123;
	%end
	for j=1:(maxAttributeNumber + 1)*2
		if j<maxAttributeNumber + 2 
			LookUpTable(i,j) = Parameters(i,j)/Yes;
		else
			LookUpTable(i,j) = Parameters(i,j)/No;
		end
	end
end

