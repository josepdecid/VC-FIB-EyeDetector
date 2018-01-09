function [classifier] = svm(Xtrain, Ytrain)
    classifier = fitcsvm(        ...
        Xtrain, Ytrain,          ...
        'KernelFunction', 'rbf', ...
        'BoxConstraint', Inf,     ...
        'Standardize', true);
end

