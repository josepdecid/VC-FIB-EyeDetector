path = strcat(pwd, '/dataset/');

[images, eyes] = readData(path);
[trainset, testset] = splitData(images, eyes, 80);

eyes = getEyes(trainset, 90);