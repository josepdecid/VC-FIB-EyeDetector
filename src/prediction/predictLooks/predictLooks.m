function [prediction] = predictLooks(pred, image, eyesPos, dims)    
    [left, right] = getEyesInImage(image, eyesPos, dims.subImgSize);
    eyes = zeros([dims.subImgSize, dims.subImgSize, 2]);
    eyes(:, :, 1) = left;
    eyes(:, :, 2) = right;
    
    Tbl = joinFeaturesLooks(eyes, []);
    [~, scores] = predict(pred, Tbl);
    
    maxScores = max(scores);
    prediction = maxScores(1) >= maxScores(2);
end

