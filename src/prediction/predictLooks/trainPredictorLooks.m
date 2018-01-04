function [pred] = trainPredictorLooks(looks, noLooks)
    Tbl = joinFeaturesLooks(looks, noLooks);
    
    LabelsLooks = repmat('L', 1, length(looks));
    LabelsNoLooks = repmat('N', 1, length(noLooks));
    Labels = horzcat(LabelsLooks, LabelsNoLooks);
    
    pred = TreeBagger(100, Tbl, Labels');
end

