function [classifier] = randomForest(Tbl, Labels, nTree)
    if nTree == -1
        nTrees = round(10 .^ (0:0.2:2.2));

        classifiers = cell(length(nTrees), 1);
        OOBs = zeros(length(nTrees), 1);
        OOB = -1;

        for i = 1:length(nTrees)
            classifiers{i} = TreeBagger( ...
                nTrees(i), Tbl, Labels,  ...
                'OOBPrediction', 'on',   ...
                'Prior', 'Empirical',    ...
                'Options', statset('UseParallel', true));

            OOBs(i) = oobError(classifiers{i}, 'Mode', 'ensemble');
            prevDif = i > 1 && abs(OOBs(i - 1) - OOBs(i)) < 0.0002;
            if OOBs(i) < 0.01 || prevDif
                OOB = OOBs(i);
                break;
            end
        end

        if OOB == -1
           [OOB, i] = min(OOBs);
        end
        classifier = classifiers{i};

        i = min(i + 1, length(nTrees));
        figure; plot(nTrees(1:i), OOB, '-o');
    else
        classifier = TreeBagger(        ...
            nTree, Tbl, Labels,         ...
            'OOBPrediction', 'on',      ...
            'Prior', 'Empirical',       ...
            'Options', statset('UseParallel', true));
    end
end