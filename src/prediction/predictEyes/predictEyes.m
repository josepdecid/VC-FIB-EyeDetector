function [label, scores] = predictEyes(pred, image, dims, rectSize)
    subImages = zeros([dims.subImgSize, dims.subImgSize, ((dims.imgSize - rectSize)/(dims.steps))^2]);
    k = 1;
    for i = 1:(dims.steps):(dims.imgSize - rectSize)
        for j = 1:(dims.steps):(dims.imgSize - rectSize)
            subImage = imcrop(image, [i, j, rectSize, rectSize]);
            subImages(:, :, k) = imresize(subImage, [dims.subImgSize, dims.subImgSize]);
            k = k + 1;
        end
    end
    
    Tbl = joinFeaturesEyes(subImages, []);
    [label, scores] = predict(pred, Tbl);
end

