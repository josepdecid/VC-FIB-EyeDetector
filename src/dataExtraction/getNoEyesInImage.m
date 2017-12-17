function [images] = getNoEyesInImage(image, eyesInfo, resize, n)
    eyesPos = vec2mat(eyesInfo, 2);
    dist = pdist(eyesPos, 'euclidean');
    rectSize = ceil(0.65 * dist);
    halfSize = ceil(rectSize / 2);
    
    [r, c] = size(image);
    lp = eyesPos(1, :) - halfSize - rectSize;
    rp = eyesPos(2, :) - halfSize - rectSize;
    off = 2 * rectSize;
    
    images = zeros([resize, resize, n]);
    
    for i = 1:n
        x = randi(r - rectSize); y = randi(c - rectSize);
        while posInsideEye(x, y, lp, off) || posInsideEye(x, y, rp, off)
            x = randi(r - rectSize); y = randi(c - rectSize);
        end
        subImage = imcrop(image, [x, y, rectSize, rectSize]);
        images(:, :, i) = imresize(subImage, [resize, resize]);
    end
    
    function [isInside] = posInsideEye(px, py, pe, offset)
       isInside = px >= pe(1) && px <= pe(1) + offset ...
                  && py >= pe(2) && py <= pe(2) + offset;
    end 
end