function [pred] = trainPredictorEyes(eyes, noEyes)
    Tbl = joinFeaturesEyes(eyes, noEyes);
    
    LabelsEyes = repmat('E', 1, length(eyes));
    LabelsNoEyes = repmat('N', 1, length(noEyes));
    Labels = horzcat(LabelsEyes, LabelsNoEyes);
    
    pred = TreeBagger(100, Tbl, Labels');
end

