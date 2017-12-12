function [images, eyes] = readData(path)
    imgsDir = dir(strcat(path, '*.pgm'));
    eyesDir = dir(strcat(path, '*.eye'));
    n = length(imgsDir);
    assert(n == length(eyesDir), 'Different number of images and eyes');
    
    height = 286; % Dataset img height
    width = 384; % Dataset img width
    rescale = [width, height, width, height];
    
    resize = 250; % Size of reduced image
    images = zeros([resize, resize, n]);
    eyes = zeros([n, 4]);
    
    % Images
    for i = 1:n
         imgName = imgsDir(i).name;
         img = imread(strcat(path, imgName));
         s = size(img);
         l = length(s);
         if l == 3
             img = rgb2gray(img);
         end
         images(:, :, i) = imresize(img, [resize, resize]);
    end
    
    % Eyes
    for i = 1:n
       eyeName = eyesDir(i).name;
       eyeID = fopen(strcat(path, eyeName), 'r');
       eyes(i, 1:4) = fscanf(eyeID, '#LX LY RX RY %d %d %d %d');
       for j = 1:4
           eyes(i, j) = eyes(i, j) * resize / rescale(j);
       end
       fclose(eyeID);
    end
end