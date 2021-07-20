trainData=readtable('C:\Users\saifm\Downloads\Documents\ECE\Graduation_Project\SisFall\SisFall_dataset\SISFALL\FULL_DATA\TRAIN_SISFALL.csv');

if isempty(gcp('nocreate'))
    parpool('local')
end
actLabels ={'D01','D02','D03','D04','D05','F01','F02','F03','F04','F05'};
 
NA = size(trainData(1:1000,{'ACCX','ACCY','ACCZ'}), 1);
XA = num2cell(NA, 1);

for k = 1:NA
    for i=1:3
        XA{i} = [trainData(i, 'ACCX') trainData(i, 'ACCY') trainData(i, 'ACCZ')]
    end
end
actTrain = categorical(trainData.ACTIVITY);


% Cross varidation (train: 90%, validation: 10%)
cv = cvpartition(size(XA,1),'HoldOut',0.1);
idx = cv.test;
% Separate to training and test data
XTrain = XA(~idx,:);
XValidation  = XA(idx,:);

%spilt into YTrain and YValdation
% Cross varidation (train: 90%, validation: 10%)
cv = cvpartition(size(actTrain,1),'HoldOut',0.1);
idx = cv.test;
% Separate to training and test data
YTrain = actTrain(~idx,:);
YValidation  = actTrain(idx,:);


inputSize = 3;
numHiddenUnits = 100;
numHiddenUnits1 = 150;
numClasses = 10;


layers = [ ...
    sequenceInputLayer(inputSize,'Normalization','zscore')
    tanhLayer
%     reluLayer
    bilstmLayer(numHiddenUnits,'OutputMode','last')
    dropoutLayer(0.9)
%     bilstmLayer(numHiddenUnits,'OutputMode','last')
%     dropoutLayer(0.3)
%   lstmLayer(numHiddenUnits,'OutputMode','sequence')
%     dropoutLayer(0.2)
%     lstmLayer(numHiddenUnits1, 'OutputMode', 'last')
%     dropoutLayer(0.2)
    fullyConnectedLayer(numClasses)
%     tanhLayer
    softmaxLayer
    classificationLayer];

%% Define training options

options = trainingOptions('adam', ...
    'InitialLearnRate', 0.0005, ...
    'L2Regularization', 0.0001, ...
    'LearnRateSchedule', 'piecewise', ...
    'GradientThreshold',2,...
    'LearnRateDropPeriod', 100, ...
    'LearnRateDropFactor', 0.1, ...
    'MaxEpochs', 10, ...
    'MiniBatchSize', 128, ...
    'ResetInputNormalization',false,...
    'Plots', 'training-progress',...
    'ExecutionEnvironment', 'cpu',...
    'Shuffle','every-epoch',...
    'SequenceLength','longest');
%     'ValidationData',{XValidation,YValidation}, ...
%     'ValidationFrequency',30, ...

%% Train LSTM

[net, info] = trainNetwork(XTrain, YTrain, layers, options);


%DATA CONVERSION FOR THE TEST DATA

NB = size(testData, 1);
XB = cell(NB, 1);

parfor k = 1:NB
    
    XB{k} = [testData{k, 'ACCX'}; testData{k, 'ACCY'}; testData{k, 'ACCZ'}];
    
end

actTest = categorical(testData.ACTIVITY);



%% Check performance

acc = classify(net, XB);
displayResult(actTest, acc, actLabels)

%% Save results

save 'classifyUsingLSTM'








% of=readtable('C:\Users\saifm\Downloads\Documents\ECE\Graduation_Project\SisFall\SisFall_dataset\SISFALL\FULL_DATA\Sisfall_Complete_Dataset.csv');
% datatemp=of{:,:};
% data1=datatemp(1:621607,1:3);
% data1act=datatemp(1:621607,4);
% data2=datatemp(776175:1241884,1:3);
% data2act=datatemp(776175:1241884,4);
% xtrain={data1.';data2.'};
% ytrain=[data1act ;data2act];
% ytrain=categorical(ytrain);
% 
% numObservations = numel(xtrain);
% for i=1:numObservations
%     sequence = xtrain{i};
%     sequenceLengths(i) = size(sequence,2);
% end
% [sequenceLengths,idx] = sort(sequenceLengths);
% xtrain = xtrain(idx);
% ytrain = ytrain(idx);
% 
% 
% inputSize = 3;
% numHiddenUnits = 100;
% numClasses = 2;
% 
% layers = [ ...
%     sequenceInputLayer(inputSize)
%     bilstmLayer(numHiddenUnits,'OutputMode','last')
%     fullyConnectedLayer(numClasses)
%     softmaxLayer
%     classificationLayer];
% 
% maxEpochs = 2;
% miniBatchSize = 27;
% 
% options = trainingOptions('adam', ...
%     'ExecutionEnvironment','cpu', ...
%     'GradientThreshold',1, ...
%     'MaxEpochs',maxEpochs, ...
%     'MiniBatchSize',miniBatchSize, ...
%     'SequenceLength','longest', ...
%     'Shuffle','never', ...
%     'Verbose',0, ...
%     'Plots','training-progress');
% net = trainNetwork(xtrain,ytrain,layers,options);
% % data=xtrain;
% % data1=ytrain;
% % 
% % 
% % [m,n] = size(data) ;
% % P = 0.70 ;
% % idx = randperm(m)  ;
% % XTrain = data(idx(1:round(P*m)),:) ; 
% % XTest = data(idx(round(P*m)+1:end),:) ;
% % YTrain = data1(idx(1:round(P*m)),:) ; 
% % YTest = data1(idx(round(P*m)+1:end),:) ;
% % 
% % 
% % 
% % % 
% % % X = XTrain{1}(1,:);
% % % classes = categories(YTrain{1});
% % % figure
% % % for j = 1:numel(classes)
% % %     label = classes(j);
% % %     idx = find(ytrain{1} == label);
% % %     hold on
% % %     plot(idx,X(idx))
% % % end
% % % hold off
% % % xlabel("Time Step")
% % % ylabel("Acceleration")
% % % title("Training Sequence 1, Feature 1")
% % % legend(classes,'Location','northwest')
% % 
% % numFeatures = 3;
% % numHiddenUnits = 200;
% % numClasses = 3;
% % 
% % layers = [ ...
% %     sequenceInputLayer(numFeatures,'Normalization','zscore')
% %     lstmLayer(numHiddenUnits,'OutputMode','sequence')
% %     fullyConnectedLayer(numClasses)
% %     softmaxLayer
% %     classificationLayer];
% % 
% % options = trainingOptions('adam', ...
% %     'MaxEpochs',100, ...
% %     'GradientThreshold',2, ...
% %     'Verbose',0, ...
% %     'Plots','training-progress',...
% %     'ValidationData',{XTest,YTest});
% % 
% % 
% % net = trainNetwork(XTrain,YTrain,layers,options);
% % 
% % % figure
% % % plot(XTest{1}')
% % % xlabel("Time Step")
% % % legend("Feature " + (1:numFeatures))
% % % title("Test Data")
% % 
% % YPred = classify(net,XTest{1});
% % % 
% % acc = sum(YPred == YTest{1})./numel(YTest{1});
% % 
% % % figure
% % % plot(YPred,'.-')
% % % hold on
% % % plot(YTest{1})
% % % hold off
% % % 
% % % xlabel("Time Step")
% % % ylabel("Activity")
% % % title("Predicted Activities")
% % % legend(["Predicted" "Test Data"])