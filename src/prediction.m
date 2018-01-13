rng(1710);
predEyes = trainPredictorEyes(eyes, noEyes);


% predLooks = trainPredictorLooks(looks, noLooks);

rectSize = 30;

testImages = testset{1};
testEyesPos = testset{2};
predictedPositions = zeros(100, 4);
looksPrediction = zeros(100, 1);

for i = 1:100
    [~, scores] = predictEyes(predEyes, testImages(:, :, i), dimensions, rectSize);
    [pos1, pos2] = getEyesFromScores(scores(:, 1), dimensions, rectSize);
    predictedPositions(i, :) = [pos1, pos2];
    
    %looksPrediction(i) = predictLooks(predLooks, testImages(:, :, i), ...
    %    testEyesPos(i, :), dimensions.subImgSize);
end