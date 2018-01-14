function [features] = joinFeaturesEyes(eyes, noEyes)
    features = horzcat(                             ...
                    buildMeanFeature(eyes, noEyes));
end

