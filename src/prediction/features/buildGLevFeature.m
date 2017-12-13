function [Tbl] = buildGLevFeature(eyes, noEyes)
    totalLength = length(eyes) + length(noEyes);
    
    Tbl = zeros([totalLength, 256]);
    
    for i = 1:length(eyes)
       Tbl(i, :) = imhist(eyes(:, :, i))';
    end
    for i = 1:length(noEyes)
       Tbl(i + length(eyes), :) = imhist(noEyes(:, :, i))';
    end
end

