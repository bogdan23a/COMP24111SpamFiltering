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
Parameters = zeros(57,4);
for i = 1:57
  s = 0;
  for j = 1:2300
  	if LabelSet(j) == 1
  	  if AttributeSet(j, i) == 1
   	    Parameters(i,1) = Parameters(i,1) + 1;
   	  else
   	  	Parameters(i,2) = Parameters(i,2) + 1;
   	  end
   	else
   	  if AttributeSet(j, i) == 1
	   	Parameters(i,3) = Parameters(i,3) + 1;
	   else 
	   	Parameters(i,4) = Parameters(i,4) + 1;
	  end
	end
  end

end



for i=1:57
	LookUpTable(i, 1) = Parameters(i, 1) / Yes;
	LookUpTable(i, 2) = Parameters(i, 2) / Yes;
	LookUpTable(i, 3) = Parameters(i, 3) / No;
	LookUpTable(i, 4) = Parameters(i, 4) / No;

end



sum(LookUpTable(i,1))