function [images] = getNoEyesInImage(image, eyesInfo, resize, n)
    eyesPos = vec2mat(eyesInfo, 2);
    dist = pdist(eyesPos, 'euclidean');
    rectSize = ceil(0.65 * dist);
    halfSize = ceil(rectSize / 2);
    
    [r, c] = size(image);
    leftPos = eyesPos(1, :) - halfSize - rectSize;
    rightPos = eyesPos(2, :) - halfSize - rectSize;
    
    images = zeros([resize, resize, n]);
    
    % TODO: Menys cutre v
    indexX = zeros([r, c]);
    indexY = zeros([r, c]);
    for j = 1:r
       for k = 1:c
           indexX(j, k) = j;
           indexY(j, k) = k;
       end
    end
    for j = 1:r
        for k = 1:c
            ix = indexX(j, k); iy = indexY(j, k);
            ex = leftPos(1); ey = leftPos(2);
            if (ix >= ex && ix <= ex + 2*rectSize && iy >= ey && iy <= ey + 2*rectSize)
                indexX(j, k) = NaN;
                indexY(j, k) = NaN;
            end
            ex = rightPos(1); ey = rightPos(2);
            if (ix >= ex && ix <= ex + 2*rectSize && iy >= ey && iy <= ey + 2*rectSize)
                indexX(j, k) = NaN;
                indexY(j, k) = NaN;
            end
            
        end
    end
    indexX = indexX(~isnan(indexX));
    indexY = indexY(~isnan(indexY));
    % TODO: Menys cutre ^
    
    for i = 1:n
        pos = [indexX(randi(length(indexX))), indexY(randi(length(indexY)))];
        subImage = imcrop(image, [pos, rectSize, rectSize]);
        images(:, :, i) = imresize(subImage, [resize, resize]);
    end
end