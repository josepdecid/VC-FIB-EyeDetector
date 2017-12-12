pred = trainPredictor(eyes, noEyes);

testImages = testset{1};
scores = predictImages(pred, testImages(:, :, 2));