load('SisDataset');
XA = [trainData.ACCX trainData.ACCY trainData.ACCZ];
XA = XA';
act = trainData.ACTIVITY;
act = full(ind2vec(act'));
%% Train autoencoder

hiddenSize = 100;

autoenc1 = trainAutoencoder(XA, hiddenSize, ...
    'MaxEpochs', 500, ...
    'L2WeightRegularization', 0.0001, ...
    'SparsityRegularization', 0.0001, ...
    'SparsityProportion', 0.1, ...
    'ScaleData', false);

%% Check network

view(autoenc1)

%% Extract features

feat1 = encode(autoenc1, XA);

%% Train autoencoder

hiddenSize = 50;

autoenc2 = trainAutoencoder(feat1, hiddenSize, ...
    'MaxEpochs', 500, ...
    'L2WeightRegularization', 0.0001, ...
    'SparsityRegularization', 0.0001, ...
    'SparsityProportion', 0.1, ...
    'ScaleData', false);

%% Extract features

feat2 = encode(autoenc2, feat1);

%% Train softmax layer

softnet = trainSoftmaxLayer(feat2, act, 'MaxEpochs', 300);


deepnet = stack(autoenc1, autoenc2, softnet);

deepnet = train(deepnet, XA, act);

XB = [testData.ACCX testData.ACCY testData.ACCZ];
XB = XB';
actt = testData.ACTIVITY;
actt = full(ind2vec(actt'));
%% Check performace

TBHat = deepnet(XB);
plotconfusion(actt, TBHat)
