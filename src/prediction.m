%pred = trainPredictor(eyes, noEyes);

rectSize = 30;
rectSizeVec = [rectSize, rectSize];
testImages = testset{1};

for i = 1:length(testImages)
    [~, scores] = predictImages(pred, testImages(:, :, i), rectSize);

    eyeScores = scores(:, 1);
    [pos1, pos2] = getEyesFromScores(eyeScores, rectSize);

    I = uint8(squeeze(testImages(:, :, i)));
    I = insertShape(I, 'rectangle', [pos1, rectSizeVec], 'LineWidth', 1);
    I = insertShape(I, 'rectangle', [pos2, rectSizeVec], 'LineWidth', 1);
    imshow(I);
end