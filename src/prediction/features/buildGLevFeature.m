function [Tbl] = buildGLevFeature(imageSet1, imageSet2)
    totalLength = size(imageSet1, 3) + length(imageSet2);
    
    Tbl = zeros([totalLength, 256]);
    
    for i = 1:size(imageSet1, 3)
       Tbl(i, :) = imhist(imageSet1(:, :, i))';
    end
    for i = 1:length(imageSet2)
       Tbl(i + size(imageSet1, 3), :) = imhist(imageSet2(:, :, i))';
    end
end

