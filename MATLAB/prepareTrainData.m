NA = size(trainData, 1);
XA = cell(NA, 1);

parfor k = 1:NA
    
    XA{k} = [trainData{k, 'ACCX'}; trainData{k, 'ACCY'}; trainData{k, 'ACCZ'}];
    
end

for i=1:numel(XA)
    sequence = XA{i};
    sequenceLengths(i) = size(sequence,2);
end

[sequenceLengths,idx] = sort(sequenceLengths,'descend');
XTrain = XA(idx);
% YTrain = y(idx);