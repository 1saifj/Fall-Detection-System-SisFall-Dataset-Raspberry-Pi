% function [files, labels] = testLableing(dataFolder)
% fileExtension = ".csv";
% listing = dir(fullfile(dataFolder, "*", "*" + fileExtension));
% numObservations = numel(listing);
% files = strings(numObservations,1);
% labels = cell(numObservations,1);
% for i = 1:numObservations
%     name = listing(i).name;
%     folder = size(listing(i).folder);
%     
%     [~,labels{i}] = fileparts(folder);
%     files(i) = fullfile(folder,name);
% end
% labels = categorical(labels);
% end
% 




% of=fullfile('DATA');
% rf=fullfile(of,'Train');
% catg =['Fall backward','Fall backward'];
% fds=fileDatastore(fullfile(rf,catg),'LabelSource','foldernames');




clear
close all
clc
%% create dummy inputs and targets (.mat file)
% inputs are images of size 50x1x12 [heigth, width, channels]
% target are type of material: categorical array
mkdir trainingData
cd trainingData
n=10; % number of training cases
for i=1:n
    material=ones(2,2,2)*i;
    
    if i<n/2
        matType='typeA';
    else
        matType='typeB';
    end
    mkdir(matType)
    filename=sprintf('material_%d', i);
    save(fullfile(matType,filename),'material', 'matType')
end
cd ..
%% load data
allData=fileDatastore(fullfile('trainingData'),'ReadFcn',@load,'FileExtensions','.mat', 'IncludeSubfolders', true);
%% create inputs
inputData = transform(allData,@(data) rearrange_input(data)); % extract and rearrange input
%% create targets (can be optimized...)
targetData = transform(allData,@(data) rearrange_target(data));
myLabels=targetData.readall;
writematrix(myLabels,'myLabels.txt');
labelStore = tabularTextDatastore('myLabels.txt','TextscanFormats','%C',"ReadVariableNames",false);
read_size=1; % this line is foundamental... I don't know why...
labelStore.ReadSize = read_size;
labelStoreCell = transform(labelStore,@setcat_and_table_to_cell);
%% combininig
cdsTrain = combine(inputData,labelStoreCell);
