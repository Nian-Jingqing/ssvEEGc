function [EEG, Label_EEG] = shuffle()
%% load data
load('II_Ia_Ib_data.mat');

% shuffle 
rowrank = randperm(size(II_Ia_Ib_data, 1));  % 随机打乱的数字，从1~行数打乱
Label_EEG = II_Ia_Ib_data(rowrank, : );  % 按照rowrank打乱矩阵的行数
% eeg data without label
EEG = Label_EEG( : , 2 : end);

% save('Label_EEG.mat', 'Label_EEG');
% save('EEG.mat', 'EEG');
end