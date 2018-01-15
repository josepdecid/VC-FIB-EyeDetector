nIms = length(testImages);

for i = 1:nIms
    disp(i); 
    
    eyesPos = vec2mat(predictedPositions(i, :), 2);
    dist = pdist(eyesPos, 'euclidean');
    rectSize = 0.65 * dist;
    halfSize = rectSize / 2;
    eyesPos = eyesPos - halfSize;
    
    colorP = 'red';
    if looksPrediction(i) == 1; colorP = 'green'; end
    
    colorT = 'red';
    if testEyesLook(i) == 1; colorT = 'green'; end
    
    label = 'N';
    if testEyesLook(i) == 1; label = 'Y'; end

    I = uint8(squeeze(testImages(:, :, i)));
    
    shape = [eyesPos(1, 1), eyesPos(1, 2), rectSize, rectSize];
    I = insertObjectAnnotation(...
        I, 'rectangle', shape, label, 'Color', colorT, 'LineWidth', 1);
    I = insertShape(I, 'rectangle', shape, 'Color', colorP, 'LineWidth', 1);
    
    shape = [eyesPos(2, 1), eyesPos(2, 2), rectSize, rectSize];
    I = insertShape(I, 'rectangle', shape, 'Color', colorP, 'LineWidth', 1);
    
    imshow(I);
    pause(1);
end