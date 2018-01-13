function [classifier] = logistic(Tbl, Labels)
    Labels = Labels == 'E';
    classifier = glmfit(Tbl, Labels, 'binomial', 'link', 'probit');
    yfit = glmval(classifier, Tbl, 'probit');
    plot(Tbl, Labels, 'o', Tbl, yfit, '-' , 'LineWidth', 2);
end