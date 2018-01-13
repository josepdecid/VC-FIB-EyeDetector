function [classifier] = trainPredictorEyes(eyes, noEyes)
    Tbl = joinFeaturesEyes(eyes, noEyes);
    
    LabelsEyes = repmat('E', 1, length(eyes));
    LabelsNoEyes = repmat('N', 1, length(noEyes));
    Labels = horzcat(LabelsEyes, LabelsNoEyes);
    
    classifier = svm(Tbl, Labels');
end

