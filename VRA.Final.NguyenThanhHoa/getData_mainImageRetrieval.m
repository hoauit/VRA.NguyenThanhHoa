function [thumbnails, result] = getData_mainImageRetrieval()
% Location of the compressed data set
% Store the output in a temporary folder
outputFolder = fullfile('', 'dataset_paris'); % define output folder
parisImageSet = imageDatastore(fullfile(outputFolder),'LabelSource','foldernames');

% Pick a random subset of the building images
trainingSet = parisImageSet;

% Create a custom bag of features using the 'CustomExtractor' option
if ~exist('Data_parisBagOfFeatures.mat', 'file') % Create a custom bag of features only once
    disp(' Create a custom bag of features...');
    bag = bagOfFeatures(trainingSet, ...
        'CustomExtractor', @SURFBagOfFeaturesExtractor, ...
        'VocabularySize', 10000);
end
save('Data_parisBagOfFeatures.mat','bag');
% Create a search index
if ~exist('Data_parisImageIndex.mat', 'file') % Create a search index only once
    disp('Create a search index...');
    parisImageIndex = indexImages(parisImageSet, bag);
end
save('Data_parisImageIndex.mat','parisImageIndex');


