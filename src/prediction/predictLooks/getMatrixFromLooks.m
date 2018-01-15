function [conf] = getMatrixFromLooks(conf, pred, lab)
    if lab == 1
        if pred == 1
            conf(1, 1) = conf(1, 1) + 1;
        else
            conf(1, 2) = conf(1, 2) + 1;
        end
    else
        if pred == 1
            conf(2, 1) = conf(2, 1) + 1;
        else
            conf(2, 2) = conf(2, 2) + 1;
        end
    end
end

