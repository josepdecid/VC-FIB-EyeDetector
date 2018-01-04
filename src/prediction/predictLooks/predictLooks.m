function [prediction] = predictLooks(pred, image, eyesPos, resize)

    [left, right] = getEyesInImage(image, eyesPos, resize);
    eyes = zeros([resize, resize, 2]);
    eyes(:, :, 1) = left;
    eyes(:, :, 2) = right;
    Tbl = joinFeaturesLooks(eyes, []);
    [~, scores] = predict(pred, Tbl);
    maxScores = max(scores);
    prediction = 0;
    if maxScores(1) >= maxScores(2)
        prediction = 1;
    end
end

