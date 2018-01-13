% Clear all workSpace
clearvars

% Global variables
path = strcat(pwd, '/dataset/');
dimensions = struct(    ...
    'imgSize', 250,     ... % New image size on resize
    'subImgSize', 64,   ... % SubImage size
    'width', 384,       ... % Dataset image width
    'height', 286,      ... % Dataset image height
    'steps', 2          ... % Steps between test samples
);

% Phases
dataExtraction
% prediction
% results