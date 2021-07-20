function [xPad,yPad,mask] = preprocessMiniBatch(X,Y)
    [xPad,mask] = padsequences(X,2);
    yPad = padsequences(Y,2);
    yPad = onehotencode(yPad,1);
end