function [pos1, pos2] = getEyesFromScores(scores, imageSize, rectSize)
    scores = horzcat(scores, (1:length(scores))');
    scores = sortrows(scores, 'descend');
    positions = scores(:, 2);
    % First eye
    p1 = positions(1);
    i1 = floor(p1 / (imageSize - rectSize));
    j1 = mod(p1, (imageSize - rectSize));
    pos1 = [i1, j1];
    % Second eye
    pos2 = [1, 1];
    for p = 2 : length(positions)
        p2 = positions(p);
        i2 = floor(p2 / (imageSize - rectSize));
        j2 = mod(p2, (imageSize - rectSize));
        if (i2 < i1 - rectSize/3 || i2 > i1 + rectSize/3) || ...
           (j2 < j1 - rectSize/3 || j2 > j1 + rectSize/3)
            pos2 = [i2, j2];
           break; 
        end
    end
end

