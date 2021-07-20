function [network] = trainLSTM(Data,target, neurons,solverFcn,layersNum)

data=Data;


    [R, data, target] = preProcessingLSTM(data, target);
    
    %------------LSTM Implementation-----------
    %Implement lst Layer
    %Output mode is last because we want a sequence-to-label classification 
    numFeatures = R;
    numClasses = 3;
    if (layersNum==2)
        layers = [sequenceInputLayer(numFeatures)
        lstmLayer(neurons,'OutputMode','sequence')
        dropoutLayer(0.1)
        lstmLayer(neurons,'OutputMode','last')
        fullyConnectedLayer(numClasses)
        softmaxLayer
        classificationLayer];
    else
        if(layersNum==3)
            layers = [sequenceInputLayer(numFeatures)
            lstmLayer(neurons,'OutputMode','sequence')
            dropoutLayer(0.1)
            lstmLayer(neurons,'OutputMode','sequence')
            dropoutLayer(0.1)
            lstmLayer(neurons,'OutputMode','last')
            fullyConnectedLayer(numClasses)
            softmaxLayer
            classificationLayer];
        end  
    end

    %Train configuration
    maxEpochs = 100;%60
    config = trainingOptions(solverFcn,...
        'MaxEpochs',maxEpochs,...
        'GradientThreshold',1,...
        'MiniBatchSize',20000,...
        'Shuffle','never',...
        'Verbose',false,...
        'Plots','training-progress',...
        'ExecutionEnvironment','auto');

    %Train network
    network = trainNetwork(data, target, layers, config);    
end