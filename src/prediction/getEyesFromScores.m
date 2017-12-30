function [pos1, pos2] = getEyesFromScores(scores, dims, rectSize)
    scores = horzcat(scores, (1:length(scores))');
    scores = sortrows(scores, -1);
    positions = scores(:, 2);
    % First eye
    p1 = positions(1);
    i1 = floor(p1 / (dims.imgSize - rectSize)) * dims.steps * dims.steps;
    j1 = mod(p1, (dims.imgSize - rectSize) / dims.steps) * dims.steps;
    pos1 = [i1, j1];
    % Second eye
    pos2 = [1, 1];
    for p = 2 : length(positions)
        p2 = positions(p);
        i2 = floor(p2 / (dims.imgSize - rectSize)) * dims.steps * dims.steps;
        j2 = mod(p2, (dims.imgSize - rectSize) / dims.steps) * dims.steps;
        if (i2 < i1 - rectSize/3 || i2 > i1 + rectSize/3) && ...
           (j2 > j1 - rectSize/3 && j2 < j1 + rectSize/3)
            pos2 = [i2, j2];
           break; 
        end
    end
    pos1 = pos1 + rectSize / 2;
    pos2 = pos2 + rectSize / 2;
end

