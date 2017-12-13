function [label, scores] = predictImages(pred, image)
    % TODO: 10 subdivisions (HELL 2 U ARBITRARI) Es pot fer amb un metode?
    resize = 64;
    subImages = zeros([resize, resize, (250-30)^2]);
    k = 1;
    for i = 1:(250-30)
        for j = 1:(250-30)
            subImage = imcrop(image, [i, j, 30, 30]);
            subImages(:, :, k) = imresize(subImage, [resize, resize]);
            k = k + 1;
        end
    end
    
    Tbl = joinFeatures(subImages, []);
    [label, scores] = predict(pred, Tbl);
end

