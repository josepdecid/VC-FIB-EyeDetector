function [images] = getNoEyesInImage2(image, eyesInfo, size, n)
    eyesPos = vec2mat(eyesInfo, 2);
    dist = pdist(eyesPos, 'euclidean');
    rectSize = 0.65 * dist;
    halfSize = rectSize / 2;
    
    leftPos = eyesPos(1, :) - halfSize;
    rightPos = eyesPos(2, :) - halfSize;
    
    images = zeros([size, size, n]);
    
    for i = 1:n
        ranges = [0, leftPos(1) ;
                  leftPos(1) + rectSize, rightPos(1) ;
                  rightPos(1), length(image)];
        pos = randomPositionInRange(ranges, rectSize);
        image = imcrop(image, [pos - halfSize, rectSize, rectSize]);
        images(:, :, i) = imresize(image, [size, size]);
    end
end