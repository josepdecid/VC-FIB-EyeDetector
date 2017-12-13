% Clear all workSpace
clearvars

% Global variables
path = strcat(pwd, '/dataset/');
imageSize = 250;
subImageSize = 64;
dimensions = struct(    ...
    'imgSize', 250,     ... % New image size on resize
    'subImgSize', 64,   ... % SubImage size
    'width', 384 ,       ... % Dataset image width
    'height', 286       ... % Dataset image height
);

% Phases
dataExtraction
prediction