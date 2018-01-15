function [classifier] = trainPredictorEyes(eyes, noEyes)
    Tbl = joinFeaturesEyes(eyes, noEyes);
    
    LabelsEyes = repmat('E', 1, length(eyes));
    LabelsNoEyes = repmat('N', 1, length(noEyes));
    Labels = horzcat(LabelsEyes, LabelsNoEyes);
    
    % [coeffs, scores, ~, ~, explained] = pca(Tbl);
    % acc = explained(1);
    % for i = 2:length(explained)
    %     acc = acc + explained(i);
    %     if acc > 95.0; break; end
    % end
    % Tbl = scores(:, 1:i);
    
    classifier = svm(Tbl, Labels', 4.5384, 1.6061);
end

