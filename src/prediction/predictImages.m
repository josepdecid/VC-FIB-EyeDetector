function [label, scores] = predictImages(pred, image, imageSize, rectSize, steps)
    % TODO: 10 subdivisions (HELL 2 U ARBITRARI) Es pot fer amb un metode?
    resize = 64;
    subImages = zeros([resize, resize, ((imageSize - rectSize)/steps)^2]);
    k = 1;
    for i = 1:steps:(imageSize - rectSize)
        for j = 1:steps:(imageSize - rectSize)
            subImage = imcrop(image, [i, j, rectSize, rectSize]);
            subImages(:, :, k) = imresize(subImage, [resize, resize]);
            k = k + 1;
        end
    end
    
    Tbl = joinFeatures(subImages, []);
    [label, scores] = predict(pred, Tbl);
end

