path = strcat(pwd, '/dataset/');

[images, eyes] = readData(path);
[train, test] = splitData(images, eyes, 80);