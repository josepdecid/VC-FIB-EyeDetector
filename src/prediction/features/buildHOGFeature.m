function [Tbl] = buildHOGFeature(set1, set2)
    cs = [22, 22];
    nb = 16;
    totalLength = size(set1, 3) + length(set2);
    
    hog = extractHOGFeatures(set1(:, :, 1), 'CellSize', cs, 'NumBins', nb);
    Tbl = zeros([totalLength, length(hog)]);
    Tbl(1, :) = hog;
    
    for i = 2:size(set1, 3)
       Tbl(i, :) = extractHOGFeatures(set1(:, :, i), 'CellSize', cs, 'NumBins', nb);
    end
    for i = 1:length(set2)
       Tbl(i + size(set1, 3), :) = extractHOGFeatures(set2(:, :, i), 'CellSize', cs, 'NumBins', nb);
    end
end

