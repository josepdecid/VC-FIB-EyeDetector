function [leftEye, rightEye] = getEyesInImage(image, eyesInfo)
    eyesPos = vec2mat(eyesInfo, 2);
    leftPos = eyesPos(1, :);
    rightPos = eyesPos(2, :);
    
    dist = pdist(eyesPos, 'euclidean');
    subSize = ceil(0.65 * dist / 2);
    
    leftEye = imcrop(image, [leftPos - subSize, subSize, subSize]);
    rightEye = imcrop(image, [rightPos - subSize, subSize, subSize]);
end