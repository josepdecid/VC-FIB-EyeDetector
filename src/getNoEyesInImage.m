function [images] = getNoEyesInImage(image, eyesInfo, imageNumber)
    eyesPos = vec2mat(eyesInfo, 2);
    leftPos = eyesPos(1, :);
    rightPos = eyesPos(2, :);
    
    dist = pdist(eyesPos, 'euclidean');
    rectSize = 0.65 * dist;
    halfSize = rectSize / 2;
        
    [r,c] = size(image);
    R = randperm(r - floor(halfSize), imageNumber);
    C = randperm(c - floor(halfSize), imageNumber);
    R(R >= leftPos(2) - halfSize & R <= leftPos(2) + halfSize) = NaN;
    C(C >= rightPos(1) - halfSize & C <= leftPos(1) + halfSize) = NaN;
    
    while any(isnan(R)) || any(isnan(C))
        R(isnan(R)) = randperm(r - floor(halfSize),1);
        C(isnan(C)) = randperm(c - floor(halfSize),1);
        R(R >= leftPos(2) - halfSize & R <= leftPos(2) + halfSize) = NaN;
        C(C >= rightPos(1) - halfSize & C <= leftPos(1) + halfSize) = NaN;
    end
    
    images = zeros([imageNumber,64,64]);
    for i = 1:length(R)
        subImage = imcrop(image,[C(i) - halfSize, R(i) - halfSize, rectSize, rectSize]);
        images(i,:,:) = imresize(subImage,[64,64]);
    end
   
end