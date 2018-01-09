[images, eyesPos, looksInfo] = readData(path, dimensions);
[trainset, testset] = splitData(images, eyesPos, looksInfo, 80);
[eyes, noEyes] = getEyes(trainset, 10, dimensions);
% [looks, noLooks] = getLooks(eyes, trainset{3}, dimensions.subImgSize);