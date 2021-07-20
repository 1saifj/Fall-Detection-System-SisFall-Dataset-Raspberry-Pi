
%% Find min and max
trainData =readtable('C:\Users\saifm\Downloads\Documents\ECE\Graduation_Project\SisFall\SisFall_dataset\SISFALL\FULL_DATA\TRAIN_SISFALL.csv');
testData =readtable('C:\Users\saifm\Downloads\Documents\ECE\Graduation_Project\SisFall\SisFall_dataset\SISFALL\FULL_DATA\TEST_SISFALL.csv');
if isempty(gcp('nocreate'))
    parpool('local')
end
actLabels ={'D01','D02','D03','D04','D05','F01','F02','F03','F04','F05'};


data = [trainData; testData];

ax = (data.ACCX)';
ay = (data.ACCY)';
az = (data.ACCZ)';

ax = ax(:)';
ay = ay(:)';
az = az(:)';

[~, psax] = mapminmax(ax);
[~, psay] = mapminmax(ay);
[~, psaz] = mapminmax(az);

%% Scale data (max value -> +1, min value -> -1)

NA = size(trainData, 1);

parfor k = 1:NA
        
    trainData(k, :).ACCX = mapminmax('apply', trainData(k, :).ACCX, psax);
    trainData(k, :).ACCY = mapminmax('apply', trainData(k, :).ACCY, psay);
    trainData(k, :).ACCZ = mapminmax('apply', trainData(k, :).ACCZ, psaz);
    
end

NB = size(testData, 1);

parfor k = 1:NB
    
    testData(k, :).ACCX = mapminmax('apply', testData(k, :).ACCX, psax);
    testData(k, :).ACCY = mapminmax('apply', testData(k, :).ACCY, psay);
    testData(k, :).ACCZ = mapminmax('apply', testData(k, :).ACCZ, psaz);
    
end

%% Save scaled data

clearvars -except trainData testData actLabels
save 'SisDataset'
