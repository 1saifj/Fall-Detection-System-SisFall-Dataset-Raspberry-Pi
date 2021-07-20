function [R, data, target] = preProcessingLSTM(data, target)

%----------Pre processing------------
    [R,C] = size(data);
    %We need to convert the data to a cell, num2cell does not work
    cell ={};
    for i=1:C
      cell{end+1,1} = data(:,i);  
    end
    data = cell;    %Just to be simpler
    %We can categorize like this since the array only has 1 row
    target = categorical(target);  
    
end