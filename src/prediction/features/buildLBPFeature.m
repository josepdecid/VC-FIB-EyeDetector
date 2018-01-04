function [Tbl] = buildLBPFeature(imageSet1, imageSet2)
   totalLength = size(imageSet1, 3) + length(imageSet2);
    
    lbp1 = extractLBPFeatures(imageSet1(:,:,1), 'NumNeighbor', 24);
    Tbl = zeros([totalLength,length(lbp1)]);
    Tbl(1,:) = lbp1;
    
    for i = 2:size(imageSet1, 3)
       Tbl(i, :) = extractLBPFeatures(imageSet1(:,:,i), 'NumNeighbor', 24);
    end
    for i = 1:length(imageSet2)
       Tbl(i + size(imageSet1, 3), :) = extractLBPFeatures(imageSet2(:, :, i), 'NumNeighbor', 24);
    end

end

