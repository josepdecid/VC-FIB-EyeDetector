function [images] = getNoEyesInImage2(image, eyesInfo, resize, n)
    eyesPos = vec2mat(eyesInfo, 2);
    dist = pdist(eyesPos, 'euclidean');
    rectSize = ceil(0.65 * dist);
    halfSize = ceil(rectSize / 2);
    
    leftPos = eyesPos(1, :) - halfSize;
    rightPos = eyesPos(2, :) - halfSize;
    
    images = zeros([resize, resize, n]);
    
    for i = 1:n
        ranges = [0, leftPos(1) ;
                  leftPos(1) + rectSize, rightPos(1) ;
                  rightPos(1) + rectSize, length(image)];
        pos = randomPositionInRange(ranges, rectSize);
        image = imcrop(image, [pos - halfSize, rectSize, rectSize]);
        images(:, :, i) = imresize(image, [resize, resize]);
    end
end