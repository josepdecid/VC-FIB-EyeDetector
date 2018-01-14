function [conf] = getMatrixFromScores(conf, scores, lab, dims, rectSize)
    for p = 1:size(scores, 1)
        i = floor(p / (dims.imgSize - rectSize)) * dims.steps * dims.steps;
        j = mod(p, (dims.imgSize - rectSize) / dims.steps) * dims.steps;
        pos = [i, j];
        
        isNear = pdist([pos ; lab(1:2)], 'euclidean') < rectSize ...
            || pdist([pos ; lab(3:4)], 'euclidean') < rectSize;
        if scores(p, 1) >= scores(p, 2)
            if isNear
                conf(1, 1) = conf(1, 1) + 1;
            else
                conf(1, 2) = conf(1, 2) + 1;
            end
        else
            if isNear
                conf(2, 1) = conf(2, 1) + 1;
            else
                conf(2, 2) = conf(2, 2) + 1;
            end
        end
    end
end

