%pred = trainPredictor(eyes, noEyes);

trainImages = trainset{1};
testImages = testset{1};

[~, scores] = predictImages(pred, testImages(:, :, 54));

eyeScores = scores(:, 1);
[~, pos1] = max(eyeScores);
i1 = floor(pos1 / (250-30));
j1 = mod(pos1, (250-30));

I = uint8(testImages(:, :, 54));
I = insertShape(I, 'rectangle', [i1 j1 30 30], 'LineWidth', 1);
imshow(I, []);