function [thumbnails, result,scores, queryWords,parisImageIndex,imageIDs] = mainImageRetrieval(queryImage,numResult)
h = waitbar(0,'Please wait...');
steps = 7;
% Location of the compressed data set
url1 = 'http://www.robots.ox.ac.uk/~vgg/data/parisbuildings/paris_1.tgz';
url2 = 'http://www.robots.ox.ac.uk/~vgg/data/parisbuildings/paris_2.tgz';
% Store the output in a dataset_paris folder
outputFolder = fullfile('', 'dataset_paris'); % define output folder

% If it didn't exist dataset folder, download and untar datase once
if ~exist(outputFolder, 'dir')
    waitbar(1/steps,h,'Downloading Paris Dataset...');
    untar(url1, outputFolder);
    untar(url2, outputFolder);
end
imageDataset = imageDatastore(fullfile(outputFolder),'LabelSource','foldernames');
waitbar(2/steps,h,'Generate Image DataStore ...');

% Log total number of images in the data set
numel(imageDataset.Files)

% Training Imageset = ImageDataset
trainingSet = imageDataset;
% Create a custom bag of features using the 'CustomExtractor' option
if ~exist('parisBagOfFeatures.mat', 'file') % Create a custom bag of features only once
    disp(' Create a custom bag of features...');
    waitbar(3/steps,h,'Create a custom bag of features using the CustomExtractor...');
    bag = bagOfFeatures(trainingSet, ...
        'CustomExtractor', @SURFBagOfFeaturesColorExtractor, ...
        'VocabularySize', 10000);
    save('parisBagOfFeatures.mat','bag');
end
% Load pre-trained bagOfFeatures if it exist
load('ParisBagOfFeatures.mat','bag');

% Create a search index
if ~exist('parisImageIndex.mat', 'file') % Create a search index only once
    disp('Create a search index...');
    waitbar(4/steps,h,'Create a search index...');
    parisImageIndex = indexImages(imageDataset, bag);
    save('parisImageIndex.mat','parisImageIndex');
end
load('parisImageIndex.mat','parisImageIndex');

% Search for the top images with similar content
waitbar(5/steps,h,'Search for the top images with similar content...');
[imageIDs,scores,queryWords] = retrieveImages(queryImage, parisImageIndex,'NumResults',numResult);

% Show result
thumbnails = [];
result = imageDataset.Files(imageIDs);
waitbar(6/steps,h,'Labeling...');
% Labeling result image with insertInImage
for i = 1:numel(result)
    img = imread(result{i});
    thumbnails = cat(4, thumbnails,...
        insertInImage(imresize(img, [200 200]),...
        @()text(10,10,num2str(i)),...
        {'fontweight','bold','color','b','fontsize',15,'margin',5,'edgecolor',[0 1 1],'backgroundcolor','w'}));
end
waitbar(7/steps,h,'Finishing...');
close(h);

