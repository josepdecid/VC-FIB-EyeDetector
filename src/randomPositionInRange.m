function [pos] = randomPositionInRange(ranges, size)
    n = length(ranges);
    positions = zeros(n, 1);
    for i = 1:length(ranges)
        lowerBound = ranges(i, 1);
        upperBound = ranges(i, 2) - size;
        positions(i) = (upperBound - lowerBound) .* rand() + lowerBound;
    end
    pos = positions(randi(n));
end

