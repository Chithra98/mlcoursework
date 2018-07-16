function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = .01;
sigma = 0.01;
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
predictions = svmPredict(model, Xval);
error = mean(double(predictions ~= yval));
        
values = [0.01 0.03 0.1 0.3 1 3 10 30];
len = length(values);


for i = 1:len
    for j = 1:len
        c= values(i);
        sig= values(j);
        
        model= svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, sig));
        predictions = svmPredict(model, Xval);
        err = mean(double(predictions ~= yval));
        
        if err < error          
            C = c;
            sigma = sig;
            error =  err;
        end;
    end;
end;
end;