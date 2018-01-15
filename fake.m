conf = [609, 5237; 335615, 3336939];
acc = sum(diag(conf)) / sum(sum(conf))
hac = 2 / sum(1 ./ (diag(conf) ./ sum(conf, 2)))