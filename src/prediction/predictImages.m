function [label, scores] = predictImages(pred, image, imageSize, rectSize)
    % TODO: 10 subdivisions (HELL 2 U ARBITRARI) Es pot fer amb un metode?
    resize = 64;
    subImages = zeros([resize, resize, ((imageSize - rectSize)/5)^2]);
    k = 1;
    for i = 1:(imageSize - rectSize)/5
        for j = 1:(imageSize - rectSize)/5
            subImage = imcrop(image, [i*5, j*5, rectSize, rectSize]);
            subImages(:, :, k) = imresize(subImage, [resize, resize]);
            k = k + 1;
        end
    end
    
    Tbl = joinFeatures(subImages, []);
    [label, scores] = predict(pred, Tbl);
end

