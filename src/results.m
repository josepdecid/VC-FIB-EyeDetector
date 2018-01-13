for i = 1:100
    eyesPos = vec2mat(predictedPositions(i, :), 2);
    dist = pdist(eyesPos, 'euclidean');
    rectSize = 0.65 * dist;
    halfSize = rectSize / 2;
    eyesPos = eyesPos - halfSize;
    
    color = 'red';
    if looksPrediction(i) == 1
        color = 'green';
    end

    I = uint8(squeeze(testImages(:, :, i)));
    shape = [eyesPos(1, 1), eyesPos(1, 2), rectSize, rectSize];
    % I = insertObjectAnnotation(I, 'rectangle', shape, testset{3}(i), ...
    %    'Color', color, 'LineWidth', 1);
    I = insertShape(I, 'rectangle', shape, 'Color', 'yellow', 'LineWidth', 1);
    shape = [eyesPos(2, 1), eyesPos(2, 2), rectSize, rectSize];
    I = insertShape(I, 'rectangle', shape, 'Color', 'yellow', 'LineWidth', 1);
    imshow(I);
    pause(1);
end