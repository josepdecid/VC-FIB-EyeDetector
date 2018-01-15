function [Tbl] = buildLBPFeature(imageSet1, imageSet2)
    cs = [20, 20];
    nb = 8;
    totalLength = size(imageSet1, 3) + length(imageSet2);
    
    lbp1 = extractLBPFeatures(imageSet1(:,:,1), 'CellSize', cs, 'NumNeighbors', nb);
    Tbl = zeros([totalLength,length(lbp1)]);
    Tbl(1,:) = lbp1;
    
    for i = 2:size(imageSet1, 3)
       Tbl(i, :) = extractLBPFeatures(imageSet1(:,:,i), 'CellSize', cs, 'NumNeighbors', nb);
    end
    for i = 1:length(imageSet2)
       Tbl(i + size(imageSet1, 3), :) = extractLBPFeatures(imageSet2(:, :, i), 'CellSize', cs, 'NumNeighbors', nb);
    end

end

