%
%Setup variables
%
maxAttributeNumber = 1;
classNumber = 2;



Yes=0;
No=0;
Maybe=0;
for i = 1:2300
	if LabelSet(i) == 2
		Maybe = Maybe + 1;
	elseif LabelSet(i) == 1
		Yes = Yes + 1;
	else
		No = No + 1;
	end
end

%
%P(Yes),P(No)
%
YesProbability = Yes / 2300;
MaybeProbability = Maybe / 2300;
NoProbability = No / 2300;

%
%Count each feature in each classification
%For each one of the 57 features i have to 
%count both the 1's and 0's for 
%

%numOfClasses = 2;

Parameters = zeros(57,(maxAttributeNumber + 1)*classNumber);

for i = 1:57
  currentAttributeNumber = maxAttributeNumber;
  while currentAttributeNumber >= 0
	  for j = 1:2300
	  	%
	  	%if three classes classes
	  	%
	  	if Maybe ~= 0
		  	if LabelSet(j) == 2
		  	  
		  	  if(AttributeSet(j,i) == currentAttributeNumber)
		  	  	Parameters(i, maxAttributeNumber - currentAttributeNumber + 1) = Parameters(i, maxAttributeNumber - currentAttributeNumber + 1) + 1;
		  	  end
		   	elseif LabelSet(j) == 1
		   	  if(AttributeSet(j,i) == currentAttributeNumber)
		  	  	Parameters(i, 2 * maxAttributeNumber - currentAttributeNumber + 2) = Parameters(i, 2 * maxAttributeNumber - currentAttributeNumber + 2) + 1;
		  	  end
		  	else
		  	  	if(AttributeSet(j,i) == currentAttributeNumber)
		  	  		Parameters(i, 3 * maxAttributeNumber - currentAttributeNumber + 3) = Parameters(i, 3 * maxAttributeNumber - currentAttributeNumber + 3) + 1;
		  	  	end
				end
			%
			%if two classes
			%
			else
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
	  end
	  currentAttributeNumber = currentAttributeNumber - 1;
  end

end


LookUpTable = zeros(57,(maxAttributeNumber + 1)*classNumber);
for i=1:57
	%
	%if three classes
	%
	if Maybe ~= 0
		for j=1:(maxAttributeNumber + 1)*classNumber
			if j<maxAttributeNumber + 2 
				LookUpTable(i,j) = Parameters(i,j)/Yes;
			elseif j>=maxAttributeNumber+1 & j<=(maxAttributeNumber+1)*2 
				LookUpTable(i,j) = Parameters(i,j)/Maybe;
			else
				LookUpTable(i,j) = Parameters(i,j)/No;
			end
		end
	%
	%if two classes
	%
	else
		for j=1:(maxAttributeNumber + 1)*2
		if j<maxAttributeNumber + 2 
			LookUpTable(i,j) = Parameters(i,j)/Yes;
		else
			LookUpTable(i,j) = Parameters(i,j)/No;
		end
	end
	end

end
