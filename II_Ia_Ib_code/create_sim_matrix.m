function M = create_sim_matrix(EEG)
% number of row and col
[n, m] = size(EEG);
% Similarity matrix
M = zeros(n);

% �˴��иĽ��ռ䣬ED��һ�����Ժܺõĺ�������EEG���������ƶ�
for i = 1 : n
    for j = 1 : n
        M(i, j) = ED(EEG(i, :), EEG(j, :));
    end
end
end