function [Tbl] = buildHOGFeature(imageSet1, imageSet2)
    totalLength = size(imageSet1, 3) + length(imageSet2);
    
    hog1 = extractHOGFeatures(imageSet1(:, :, 1));
    Tbl = zeros([totalLength, length(hog1)]);
    Tbl(1, :) = hog1;
    
    for i = 2:size(imageSet1, 3)
       Tbl(i, :) = extractHOGFeatures(imageSet1(:, :, i));
    end
    for i = 1:length(imageSet2)
       Tbl(i + size(imageSet1, 3), :) = extractHOGFeatures(imageSet2(:, :, i));
    end

end

