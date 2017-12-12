function [Tbl] = buildFeatureTable(eyes, noEyes)
    [r, c] = size(eyes(:, :, 1));
    totalLength = length(eyes) + length(noEyes);
    
    Tbl = zeros([totalLength, r + c]);
    
    for i = 1:length(eyes)
       Tbl(i, :) = meansRowCol(eyes(:, :, i));
    end
    for i = 1:length(noEyes)
       Tbl(i + length(eyes), :) = meansRowCol(noEyes(:, :, i));
    end
end

