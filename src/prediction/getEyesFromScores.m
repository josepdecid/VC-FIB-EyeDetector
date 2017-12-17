function [pos1, pos2] = getEyesFromScores(scores, rectSize)
    scores = horzcat(scores, (1:length(scores))');
    scores = sort(scores, 'descend');
    positions = scores(:, 2);
    % First eye
    p1 = positions(1);
    i1 = floor(p1 / (250 - rectSize));
    j1 = mod(p1, (250 - rectSize));
    pos1 = [i1, j1];
    % Second eye
    pos2 = [1, 1];
    for p = 2 : length(positions)
        p2 = positions(p);
        i2 = floor(p2 / (250 - rectSize));
        j2 = mod(p2, (250 - rectSize));
        if (i2 < i1 - rectSize || i2 > i1 + rectSize) || ...
           (j2 < j1 - rectSize || j2 > j1 + rectSize)
            pos2 = [i2, j2];
           break; 
        end
    end
end

