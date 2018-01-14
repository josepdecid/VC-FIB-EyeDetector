function [classifier] = knn(Tbl, Labels, K, Dist)
    if K == -1 || Dist == ''
        neighbours = [3, 5, 7, 9, 11, 13];
        distances = [           ...
            string(euclidean),  ...
            string(seuclidean), ...
            string(mahalanobis)];

        classifiers = cell(length(neighbours), length(distances));
        errors = zeros(length(neighbours), length(distances));

        for i = 1:length(neighbours)
            for j = 1:length(distances)
                classifiers{i, j} = fitcknn(       ...
                    Tbl, Labels,                   ...
                    'NumNeighbors', neighbours(i), ...
                    'Distance', char(distances(j)));

                CVal = crossval(classifiers{i, j});
                errors(i, j) = kfoldLoss(CVal);
            end
        end

        [~, idx] = min(errors(:));
        [minR, minC] = ind2sub(size(errors), idx);
        classifier = classifiers{minR, minC};
    else
        classifier = fitcknn(  ...
            Tbl, Labels,       ...
            'NumNeighbors', K, ...
            'Distance', Dist);
    end
end

