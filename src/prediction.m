%pred = trainPredictor(eyes, noEyes);

rectSize = 30;
rectSizeVec = [rectSize, rectSize];

testImages = testset{1};
predictedPositions = zeros(length(testImages), 4);

%for i = 1:length(testImages)
%    [~, scores] = predictImages(pred, testImages(:, :, i), imageSize, rectSize);
%    [pos1, pos2] = getEyesFromScores(scores(:, 1), imageSize, rectSize);
%    predictedPositions(i, :) = [pos1, pos2];
%end

[~, scores] = predictImages(pred, testImages(:, :, 99), imageSize, rectSize);
[pos1, pos2] = getEyesFromScores(scores(:, 1), imageSize, rectSize);
I = uint8(squeeze(testImages(:, :, 99)));
I = insertShape(I, 'rectangle', [pos1, rectSize, rectSize], 'LineWidth', 1);
I = insertShape(I, 'rectangle', [pos2, rectSize, rectSize], 'LineWidth', 1);
imshow(I);