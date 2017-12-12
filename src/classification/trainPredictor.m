function [pred] = trainPredictor(eyes, noEyes)
    Tbl = buildFeatureTable(eyes, noEyes);
    
    LabelsEyes = repmat('E', 1, length(eyes));
    LabelsNoEyes = repmat('N', 1, length(noEyes));
    Labels = horzcat(LabelsEyes, LabelsNoEyes);
    
    pred = TreeBagger(10, Tbl, Labels);
end

