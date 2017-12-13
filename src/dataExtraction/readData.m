function [images, eyes] = readData(path, dims)
    imgsDir = dir(strcat(path, '*.pgm'));
    eyesDir = dir(strcat(path, '*.eye'));
    n = length(imgsDir);
    assert(n == length(eyesDir), 'Different number of images and eyes');
    
    rescale = [dims.width, dims.height, dims.width, dims.height];
    images = zeros([dims.imgSize, dims.imgSize, n]);
    eyes = zeros([n, 4]);
    
    for i = 1:n
        % Images
        imgName = imgsDir(i).name;
        img = imread(strcat(path, imgName));
        s = size(img);
        l = length(s);
        if l == 3
            img = rgb2gray(img);
        end
        images(:, :, i) = imresize(img, [dims.imgSize, dims.imgSize]);
        % Eyes
        eyeName = eyesDir(i).name;
        eyeID = fopen(strcat(path, eyeName), 'r');
        eyes(i, 1:4) = fscanf(eyeID, '#LX LY RX RY %d %d %d %d');
        for j = 1:4
            eyes(i, j) = eyes(i, j) * dims.imgSize / rescale(j);
        end
        fclose(eyeID);
    end
end