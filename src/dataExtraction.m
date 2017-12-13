[images, eyesPos] = readData(path, dimensions);
[trainset, testset] = splitData(images, eyesPos, 80);
[eyes, noEyes] = getEyes(trainset, 10, dimensions);