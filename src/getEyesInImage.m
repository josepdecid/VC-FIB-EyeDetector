function [leftEye, rightEye] = getEyesInImage(image, eyesInfo, resize)
    eyesPos = vec2mat(eyesInfo, 2);
    dist = pdist(eyesPos, 'euclidean');
    rectSize = 0.65 * dist;
    halfSize = rectSize / 2;
    
    leftPos = eyesPos(1, :) - halfSize;
    rightPos = eyesPos(2, :) - halfSize;
    
    leftEye = imcrop(image, [leftPos - halfSize, rectSize, rectSize]);
    rightEye = imcrop(image, [rightPos - halfSize, rectSize, rectSize]);
    
    % Same size for all eyes
    leftEye = imresize(leftEye, [resize, resize]); 
    rightEye = imresize(rightEye, [resize, resize]);
end