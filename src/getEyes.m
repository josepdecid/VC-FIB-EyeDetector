function [eyes] = getEyes(dataset)
    images = dataset{1};
    eyesData = dataset{2};
    eyes = zeros(length(images) * 2, 1);
    
    for i = 1:length(images)
        [left, right] = getEyesInImage(images(:, :, i), eyesData(i, :));
        % eyes(2*i - 1) = left;
        % eyes(2*i) = right;
    end
end
