function [label, scores] = predictImages(pred, image, imageSize, rectSize)
    % TODO: 10 subdivisions (HELL 2 U ARBITRARI) Es pot fer amb un metode?
    resize = 64;
    subImages = zeros([resize, resize, (imageSize - rectSize)*(imageSize - rectSize)/2]);
    k = 1;
    for i = 1:(imageSize - rectSize)/2
        for j = 1:(imageSize - rectSize)
            subImage = imcrop(image, [i*2, j, rectSize, rectSize]);
            subImages(:, :, k) = imresize(subImage, [resize, resize]);
            k = k + 1;
        end
    end
    
    Tbl = joinFeatures(subImages, []);
    [label, scores] = predict(pred, Tbl);
end

