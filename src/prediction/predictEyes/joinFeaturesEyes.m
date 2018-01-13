function [features] = joinFeaturesEyes(eyes, noEyes)
    features = horzcat(                             ...
                    buildHOGFeature(eyes, noEyes));
end

