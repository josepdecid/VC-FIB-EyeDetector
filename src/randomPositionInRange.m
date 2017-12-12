function [pos] = randomPositionInRange(ranges, size)
    n = length(ranges);
    positions = zeros(n, 1);
    for i = 1:n
        lowerBound = ranges(i, 1);
        upperBound = ranges(i, 2) - size;
        positions(i) = (upperBound - lowerBound) .* rand() + lowerBound;
    end
    y = randi(ranges(n, 2) - size);
    pos = [positions(randi(n)), y];
end

