function [pred] = trainPredictorLooks(looks, noLooks)
    Tbl = joinFeaturesLooks(looks, noLooks);
    
    LabelsLooks = repmat('L', 1, length(looks));
    LabelsNoLooks = repmat('N', 1, length(noLooks));
    Labels = horzcat(LabelsLooks, LabelsNoLooks);
    
    pred = svm(Tbl, Labels', 0.28065, 0.001143);
end

