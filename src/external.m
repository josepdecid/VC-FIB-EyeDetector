uploadPhoto = input('Upload image? ');

if uploadPhoto
    [ImgName, PathName] = uigetfile('*.png' ,'Select your fantastic photo <3');
    PathName = strcat(PathName, ImgName);

    Photo = imread(PathName);
else
    cam = webcamlist;
    cam = cam{1};
    Photo = snapshot(cam);
end

Photo = imresize(Photo, [dimensions.imgSize, dimensions.imgSize]);

if length(size(Photo)) == 3
   PhotoBW = rgb2gray(Photo); 
end

testEyesLook = input('Are you looking? ');

[~, scores] = predictEyes(predEyes, PhotoBW, dimensions, 30); 
[pos1, pos2] = getEyesFromScores(scores(:, 1), dimensions, 30);
predictedPositions = [pos1, pos2];
    
looksPrediction = predictLooks(predLooks, PhotoBW, predictedPositions, dimensions);

eyesPos = vec2mat(predictedPositions, 2);
dist = pdist(eyesPos, 'euclidean');
rectSize = 0.65 * dist;
halfSize = rectSize / 2;
eyesPos = eyesPos - halfSize;
    
colorP = 'red';
if looksPrediction == 1; colorP = 'green'; end
    
colorT = 'red';
if testEyesLook == 1; colorT = 'green'; end
    
label = 'N';
if testEyesLook == 1; label = 'Y'; end

I = uint8(squeeze(Photo));
    
shape = [eyesPos(1, 1), eyesPos(1, 2), rectSize, rectSize];
I = insertObjectAnnotation(...
I, 'rectangle', shape, label, 'Color', colorT, 'LineWidth', 1);
I = insertShape(I, 'rectangle', shape, 'Color', colorP, 'LineWidth', 1);
    
shape = [eyesPos(2, 1), eyesPos(2, 2), rectSize, rectSize];
I = insertShape(I, 'rectangle', shape, 'Color', colorP, 'LineWidth', 1);
    
imshow(I);