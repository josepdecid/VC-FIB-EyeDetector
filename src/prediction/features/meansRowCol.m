function [m] = meansRowCol(image)
    meanByRows = mean(image, 2)';
    meanByCols = mean(image, 1);
    m = horzcat(meanByRows, meanByCols);
end