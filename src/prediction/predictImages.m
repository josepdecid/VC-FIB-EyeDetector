function [scores] = predictImages(pred, image)
    % TODO: 10 subdivisions (HELL 2 U ARBITRARI)
    resize = 64;
    subImages = zeros([resize, resize, 100]);
    for i = 1:10
        for j = 1:10
            x = (i - 1)*25 + 1;
            y = (j - 1)*25 + 1;
            subImage = imcrop(image, [x, y, 25, 25]);
            subImages(:, :, i) = imresize(subImage, [resize, resize]);
        end
    end
    
    Tbl = buildFeatureTable(subImages, []);
    [~, scores] = predict(pred, Tbl);
end

