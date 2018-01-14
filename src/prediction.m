rng(1710);
predEyes = trainPredictorEyes(eyes, noEyes);

% predLooks = trainPredictorLooks(looks, noLooks);

rectSize = 30;

testImages = testset{1};
testEyesPos = testset{2};
predictedPositions = zeros(length(testImages), 4);
looksPrediction = zeros(length(testImages), 1);
conf = zeros(2, 2);

for i = 1:length(testImages)
    [~, scores] = predictEyes(predEyes, testImages(:, :, i), dimensions, rectSize);
    conf = getMatrixFromScores(conf, scores, testEyesPos, dimensions, rectSize);
    [pos1, pos2] = getEyesFromScores(scores(:, 1), dimensions, rectSize);
    predictedPositions(i, :) = [pos1, pos2];
    
    %looksPrediction(i) = predictLooks(predLooks, testImages(:, :, i), ...
    %    testEyesPos(i, :), dimensions.subImgSize);
end

accuracy = sum(diag(conf)) / sum(sum(conf));
accuracyF1 = 2 / sum(1 ./ (diag(conf) ./ sum(conf, 2)));