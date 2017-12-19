pred = trainPredictor(eyes, noEyes);

steps = 2;
rectSize = 30;
rectSizeVec = [rectSize, rectSize];

testImages = testset{1};
predictedPositions = zeros(3, 4);

for i = 1:length(testImages)
    [~, scores] = predictImages(pred, testImages(:, :, i), dimensions, rectSize);
    [pos1, pos2] = getEyesFromScores(scores(:, 1), dimensions, rectSize);
    predictedPositions(i, :) = [pos1, pos2];
end