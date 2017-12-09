function [images] = getNoEyesInImage(image, eyesInfo, imageNumber)
    eyesPos = vec2mat(eyesInfo, 2);
    leftPos = eyesPos(1, :);
    rightPos = eyesPos(2, :);
    
    dist = pdist(eyesPos, 'euclidean');
    rectSize = 0.65 * dist;
    halfSize = rectSize / 2;
    
    %Utilitzo halfSize altra cop per saber on és la zona retallada de l'ull
    %per no agafar com a centre cap píxel d'aquella zona. Llavors es
    %generen un nombre de files i columnes aleatòries segons el paràmetre i
    %es comprova que cap caigui en la zona no desitjada. Es posen a NaN els
    %valors que hi hagin pogut caure i es fa un bucle per reemplaçar-los en
    %cas que hi hagin. Llavors el fet que es retalli de la mateixa mida que
    %la imatge de l'ull i es faci resize també a la mateixa mida ho faig
    %per intentar que s'aproximi el més al mètode dels ulls.És una primera 
    %versió que se m'ha acudit, és bastant dolenta suposo perquè el espai
    % entre els ulls on hi ha el nas no el considero perquè pot agafar part
    % de l'ull. I en el bucle miro si tots els valors compleixen la
    % condició quan hi haurà que ja la complien d'abans.
    
    [r,c] = size(image);
    R = randperm(r - floor(halfSize), imageNumber);
    C = randperm(c - floor(halfSize), imageNumber);
    R(R >= leftPos(2) - halfSize & R <= leftPos(2) + halfSize) = NaN;
    C(C >= rightPos(1) - halfSize & C <= leftPos(1) + halfSize) = NaN;
    
    while any(isnan(R)) || any(isnan(C))
        R(isnan(R)) = randperm(r - floor(halfSize),1);
        C(isnan(C)) = randperm(c - floor(halfSize),1);
        R(R >= leftPos(2) - halfSize & R <= leftPos(2) + halfSize) = NaN;
        C(C >= rightPos(1) - halfSize & C <= leftPos(1) + halfSize) = NaN;
    end
    
    images = zeros([imageNumber,64,64]);
    for i = 1:length(R)
        subImage = imcrop(image,[C(i) - halfSize, R(i) - halfSize, rectSize, rectSize]);
        images(i,:,:) = imresize(subImage,[64,64]);
    end
   
end