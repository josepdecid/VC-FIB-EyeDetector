function [label, scores] = predictImages(pred, image, rectSize)
    % TODO: 10 subdivisions (HELL 2 U ARBITRARI) Es pot fer amb un metode?
    resize = 64;
    subImages = zeros([resize, resize, (250 - rectSize)^2]);
    k = 1;
    for i = 1:(250 - rectSize)
        for j = 1:(250 - rectSize)
            subImage = imcrop(image, [i, j, rectSize, rectSize]);
            subImages(:, :, k) = imresize(subImage, [resize, resize]);
            k = k + 1;
        end
    end
    
    Tbl = joinFeatures(subImages, []);
    [label, scores] = predict(pred, Tbl);
end

