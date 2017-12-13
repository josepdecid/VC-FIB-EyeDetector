pred = trainPredictor(eyes, noEyes);

testImages = testset{1};
[labels, scores] = predictImages(pred, trainset{1}(:, :, 42));

[~, pos] = max(scores);
i = floor(pos(1) / (250-30));
j = mod(pos(1), (250-30));

imshow(insertShape(uint8(trainset{1}(:, :, 42)), 'rectangle', [i j 30 30], 'LineWidth', 1), []);