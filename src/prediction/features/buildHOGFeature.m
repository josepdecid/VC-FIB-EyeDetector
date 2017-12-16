function [ Tbl ] = buildHOGFeature( eyes, noEyes )
    totalLength = length(eyes) + length(noEyes);
    
    hog1 = extractHOGFeatures(eyes(:,:,1));
    Tbl = zeros([totalLength,length(hog1)]);
    Tbl(1,:) = hog1;
    
    for i = 2:length(eyes)
       Tbl(i, :) = extractHOGFeatures(eyes(:,:,i));
    end
    for i = 1:length(noEyes)
       Tbl(i + length(eyes), :) = extractHOGFeatures(noEyes(:, :, i));
    end

end

