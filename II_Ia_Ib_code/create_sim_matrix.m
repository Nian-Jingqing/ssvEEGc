function M = create_sim_matrix(EEG)
% number of row and col
[n, m] = size(EEG);
% Similarity matrix
M = zeros(n);

% 此处有改进空间，ED不一定可以很好的衡量两条EEG样本的相似度
for i = 1 : n
    for j = 1 : n
        M(i, j) = ED(EEG(i, :), EEG(j, :));
    end
end
end