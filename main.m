close all;
clear all;
fname = input('Enter a filename to load data for training/testing: ','s');
load(fname);

% Put your NB training function below
[Parameters] = NBTrain(AttributeSet, LabelSet);

%[ "Parameter List" ] = NBTrain(AttributeSet, LabelSet); % NB training
% Put your NB test function below
%% functionname: function description
[predictLabel, accuracy] = NBTest(Parameters, testAttributeSet, validLabel);

%[predictLabel, accuracy] = NBTest( "Parameter List" , testAttributeSet, validLabel); % NB test

fprintf('********************************************** \n');
fprintf('Overall Accuracy on Dataset %s: %f \n', fname, accuracy);
fprintf('********************************************** \n');