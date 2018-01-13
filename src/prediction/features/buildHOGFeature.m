function [Tbl] = buildHOGFeature(imageSet1, imageSet2)
    cs = [8, 8];
    totalLength = size(imageSet1, 3) + length(imageSet2);
    
    hog1 = extractHOGFeatures(imageSet1(:, :, 1), 'CellSize', cs);
    Tbl = zeros([totalLength, length(hog1)]);
    Tbl(1, :) = hog1;
    
    for i = 2:size(imageSet1, 3)
       Tbl(i, :) = extractHOGFeatures(imageSet1(:, :, i), 'CellSize', cs);
    end
    for i = 1:length(imageSet2)
       Tbl(i + size(imageSet1, 3), :) = extractHOGFeatures(...
            imageSet2(:, :, i), 'CellSize', cs);
    end
end

