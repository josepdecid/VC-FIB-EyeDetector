function [classifier, error] = knn(Tbl, Labels)
    neighbours = [5, 9, 11, 13, 15];
    classifiers = cell(length(neighbours), 1);
    errors = zeros(length(neighbours), 1);
    
    for i = 1:length(neighbours)
        classifiers{i} = fitcknn(          ...
            Tbl, Labels,                   ...
            'NumNeighbors', neighbours(i), ...
            'Distance', 'seuclidean');
        
        CVal = crossval(classifiers{i});
        errors(i) = kfoldLoss(CVal);
    end
    
    [error, i] = min(errors);
    classifier = classifiers{i};
end

