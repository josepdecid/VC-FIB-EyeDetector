function [looks, noLooks] = getLooks(eyes, looksInfo, resize)

    looksIndex = find(looksInfo == 1);
    noLooksIndex = find(looksInfo == 0);

    looksSize = length(looksIndex);
    noLooksSize = length(noLooksIndex);
    looks = zeros([resize, resize, looksSize]);
    noLooks = zeros([resize, resize, noLooksSize]);
    
    for i = 1:looksSize
       looks(:, :, i) = eyes(:, :, 2*looksIndex(i) - 1); 
    end
    for i = 1:noLooksSize
        noLooks(:, :, i) = eyes(:, :, 2*noLooksIndex(i) - 1);
    end
end

