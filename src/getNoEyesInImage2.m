function [images] = getNoEyesInImage2(image, eyesInfo, resize, n)
    eyesPos = vec2mat(eyesInfo, 2);
    dist = pdist(eyesPos, 'euclidean');
    rectSize = ceil(0.65 * dist);
    halfSize = ceil(rectSize / 2);
    
    leftPos = eyesPos(1, :) - halfSize;
    rightPos = eyesPos(2, :) - halfSize;
    
    images = zeros([resize, resize, n]);
    
    for i = 1:n
        ranges = [0, rightPos(1) ;
                  rightPos(1) + rectSize, leftPos(1) ;
                  leftPos(1) + rectSize, length(image)];
        pos = randomPositionInRange(ranges, rectSize);
        subImage = imcrop(image, [pos, rectSize, rectSize]);
        images(:, :, i) = imresize(subImage, [resize, resize]);
    end
end