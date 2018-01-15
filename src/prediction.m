rng(1710);
predEyes = trainPredictorEyes(eyes, noEyes);
predLooks = trainPredictorLooks(looks, noLooks);

rectSize = 30;

testImages = testset{1};
testEyesPos = testset{2};
testEyesLook = testset{3};
looksPrediction = zeros(100, 1);

% Get test set eyes and noEyes and test
testEyes = zeros(dimensions.subImgSize, dimensions.subImgSize, 2 * length(testImages));
testNoEyes = zeros(dimensions.subImgSize, dimensions.subImgSize, 8 * length(testImages));

for i = 1:length(testImages)
    offset = 2*(i-1) + 1;
    [testEyes(:, :, offset), testEyes(:, :, offset+1)] = getEyesInImage(...
        testImages(:, :, i), testEyesPos(i, :), dimensions.subImgSize);
    
    offset = 8*(i-1) + 1;
    testNoEyes(:, :, offset:offset+7) = getNoEyesInImage(...
        testImages(:, :, i), testEyesPos(i, :), dimensions.subImgSize, 8);
end

confPos = zeros(2, 2);

disp('Starting eyes');

for i = 1:length(testEyes)
    Tbl = joinFeaturesEyes(testEyes(:, :, i), []);
    [~, scores] = predict(predEyes, Tbl);
    if scores(1) >= scores(2)
        confPos(1, 1) = confPos(1, 1) + 1;
    else
        confPos(1, 2) = confPos(1, 2) + 1;
    end
end

disp('Starting no eyes');

for i = 1:length(testNoEyes)
    Tbl = joinFeaturesEyes(testNoEyes(:, :, i), []);
    [~, scores] = predict(predEyes, Tbl);
    if scores(1) >= scores(2)
        confPos(2, 1) = confPos(2, 1) + 1;
    else
        confPos(2, 2) = confPos(2, 2) + 1;
    end
end

accuracyPos = sum(diag(confPos)) / sum(sum(confPos));
accuracyPosF1 = 2 / sum(1 ./ (diag(confPos) ./ sum(confPos, 2)));

% Detect is looking
confLook = zeros(2, 2);
for i = 1:length(testImages)
    disp(i);
    
    looksPrediction(i, :) = predictLooks(predLooks, testImages(:, :, i), ...
        testEyesPos(i, :), dimensions);
    confLook = getMatrixFromLooks(confLook, looksPrediction(i, :), testEyesLook(i));
end

accuracyLook = sum(diag(confLook)) / sum(sum(confLook));
accuracyLookF1 = 2 / sum(1 ./ (diag(confLook) ./ sum(confLook, 2)));

%{
for i = 1:100
    disp(i);
    
    [~, scores] = predictEyes(predEyes, testImages(:, :, i), dimensions, rectSize);
    confPos = getMatrixFromScores(confPos, scores, testEyesPos, dimensions, rectSize);
    [pos1, pos2] = getEyesFromScores(scores(:, 1), dimensions, rectSize);
    predictedPositions(i, :) = [pos1, pos2];
end

accuracyPos = sum(diag(confPos)) / sum(sum(confPos));
accuracyPosF1 = 2 / sum(1 ./ (diag(confPos) ./ sum(confPos, 2)));

%predictedPositions = testEyesPos;
%confLook = zeros(2, 2);
%for i = 1:length(testImages)
%    disp(i);
    
%    looksPrediction(i, :) = predictLooks(predLooks, testImages(:, :, i), ...
%        testEyesPos(i, :), dimensions);
%    confLook = getMatrixFromLooks(confLook, looksPrediction(i, :), testEyesLook(i));
%end

%accuracyLook = sum(diag(confLook)) / sum(sum(confLook));
%accuracyLookF1 = 2 / sum(1 ./ (diag(confLook) ./ sum(confLook, 2)));
%}