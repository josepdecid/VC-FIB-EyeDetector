function [trainset, testset] = splitData(images, eyesPos, ratio)
    n = length(images);
    nPerm = randperm(n);
    imagesRand = images(:, :, nPerm);
    eyesRand = eyesPos(nPerm, :);
    split = round(ratio * n / 100);
   
    trainset = { imagesRand(:, :, 1:split), eyesRand(1:split, :) };  
    testset = { imagesRand(:, :, split+1:n), eyesRand(split+1:n, :) };
end