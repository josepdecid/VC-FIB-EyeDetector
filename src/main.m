path = strcat(pwd, '/dataset/');

[images, eyesPos] = readData(path);
[trainset, testset] = splitData(images, eyesPos, 80);

[eyes, noEyes] = getEyes(trainset, 10);