function [EEG, Label_EEG] = shuffle()
%% load data
load('II_Ia_Ib_data.mat');

% shuffle 
rowrank = randperm(size(II_Ia_Ib_data, 1));  % ������ҵ����֣���1~��������
Label_EEG = II_Ia_Ib_data(rowrank, : );  % ����rowrank���Ҿ��������
% eeg data without label
EEG = Label_EEG( : , 2 : end);

% save('Label_EEG.mat', 'Label_EEG');
% save('EEG.mat', 'EEG');
end