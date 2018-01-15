rng(1710);
%predEyes = trainPredictorEyes(eyes, noEyes);
predLooks = trainPredictorLooks(looks, noLooks);

rectSize = 30;

testImages = testset{1};
testEyesPos = testset{2};
testEyesLook = testset{3};
predictedPositions = zeros(length(testImages), 4);
looksPrediction = zeros(length(testImages), 1);

%confPos = zeros(2, 2);
%for i = 1:length(testImages)
%    disp(i);
%    
%    [~, scores] = predictEyes(predEyes, testImages(:, :, i), dimensions, rectSize);
%    confPos = getMatrixFromScores(confPos, scores, testEyesPos, dimensions, rectSize);
%    [pos1, pos2] = getEyesFromScores(scores(:, 1), dimensions, rectSize);
%    predictedPositions(i, :) = [pos1, pos2];
%end

%accuracyPos = sum(diag(confPos)) / sum(sum(confPos));
%accuracyPosF1 = 2 / sum(1 ./ (diag(confPos) ./ sum(confPos, 2)));

predictedPositions = testEyesPos;
confLook = zeros(2, 2);
for i = 1:length(testImages)
    disp(i);
    
    looksPrediction(i, :) = predictLooks(predLooks, testImages(:, :, i), ...
        testEyesPos(i, :), dimensions);
    confLook = getMatrixFromLooks(confLook, looksPrediction(i, :), testEyesLook(i));
end

accuracyLook = sum(diag(confLook)) / sum(sum(confLook));
accuracyLookF1 = 2 / sum(1 ./ (diag(confLook) ./ sum(confLook, 2)));