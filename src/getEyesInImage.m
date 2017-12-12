function [leftEye, rightEye] = getEyesInImage(image, eyesInfo, size)
    eyesPos = vec2mat(eyesInfo, 2);
    leftPos = eyesPos(1, :);
    rightPos = eyesPos(2, :);
    
    dist = pdist(eyesPos, 'euclidean');
    rectSize = 0.65 * dist;
    halfSize = rectSize / 2;
    
    leftEye = imcrop(image, [leftPos - halfSize, rectSize, rectSize]);
    rightEye = imcrop(image, [rightPos - halfSize, rectSize, rectSize]);
    
    % Same size for all eyes
    leftEye = imresize(leftEye, [size, size]); 
    rightEye = imresize(rightEye, [size, size]);
end