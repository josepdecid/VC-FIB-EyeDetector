function [eyes, noEyes] = getEyes(dataset, ratio, dims)
    images = dataset{1};
    eyesData = dataset{2};
   
    n = length(images);
    eyes = zeros([dims.subImgSize, dims.subImgSize, 2*n]);
    
    noEyesPerImage = ceil(2*(100 - ratio) / ratio);
    noEyes = zeros([dims.subImgSize, dims.subImgSize, noEyesPerImage * n]);
    
    for i = 1:n
        currentImg = images(:, :, i);
        currentEyes = eyesData(i, :);
        currentPos = noEyesPerImage*(i-1) + 1;
        % Eyes
        [left, right] = getEyesInImage(currentImg, currentEyes, dims.subImgSize);
        eyes(:, :, 2*i - 1) = left;
        eyes(:, :, 2*i) = right;
        % No Eyes
        subImages = getNoEyesInImage(currentImg, currentEyes, dims.subImgSize, noEyesPerImage);
        noEyes(:,:, currentPos:currentPos + noEyesPerImage - 1) = subImages(:, :, :);
    end
end
