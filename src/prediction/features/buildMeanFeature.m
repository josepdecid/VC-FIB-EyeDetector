function [Tbl] = buildMeanFeature(imageSet1, imageSet2)
    [r, c] = size(imageSet1(:, :, 1));
    totalLength = size(imageSet1, 3) + length(imageSet2);
    
    Tbl = zeros([totalLength, r + c]);
    
    for i = 1:size(imageSet1, 3)
       Tbl(i, :) = meansRowCol(imageSet1(:, :, i));
    end
    for i = 1:length(imageSet2)
       Tbl(i + size(imageSet1, 3), :) = meansRowCol(imageSet2(:, :, i));
    end
end

