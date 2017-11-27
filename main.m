close all;
clear all;
fname = input('Enter a filename to load data for training/testing: ','s');
load(fname);
if(fname == 'avc_c2' )
	[MeanYes, MeanNo, StdYes, StdNo] = new(AttributeSet, LabelSet);
	[predictLabel, expected, accuracy] = newTest(testAttributeSet, validLabel, StdYes, StdNo, MeanYes, MeanNo);
else
	[Parameters, maxAttributeNumber, LookUpTable, YesProbability, NoProbability, MaybeProbability, Yes, No ] = NBTrain(AttributeSet, LabelSet); % NB training
	[predictLabel, accuracy, expected]=NBTest(Parameters, testAttributeSet, validLabel, LookUpTable, YesProbability, NoProbability, MaybeProbability, maxAttributeNumber, Yes, No);

end
confusionmat(validLabel, expected)
fprintf('********************************************** \n');
fprintf('Overall Accuracy on Dataset %s: %f \n', fname, accuracy);
fprintf('********************************************** \n');