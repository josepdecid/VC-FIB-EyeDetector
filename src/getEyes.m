function [eyes] = getEyes(dataset)
    images = dataset{1};
    eyesData = dataset{2};
   
    resize = 64;
    n = length(images);
    eyes = zeros([resize, resize, 2*n]);
    
    for i = 1:n
        [left, right] = getEyesInImage(images(:, :, i), eyesData(i, :), resize);
        eyes(:, :, 2*i - 1) = left;
        eyes(:, :, 2*i) = right;
    end
end
