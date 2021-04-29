function S = ini_s(EEG, Label_EEG, delta)
S = zeros(4, 3488);
% labeled eeg set
[n, m] = size(EEG);
plen = floor(n * delta);
for i = 1 : n
    if mylength(S(1, :)) == plen && mylength(S(2, :)) == plen
        break;
    end
    
    if Label_EEG(i, 1) == 1 && mylength(S(1, :)) < plen
        len1 = mylength(S(1, :));
        S(1, len1 + 1) = i;
    elseif Label_EEG(i, 1) == 2 && mylength(S(2, :)) < plen
        len2 = mylength(S(2, :));
        S(2, len2 + 1) = i;
    end
end 

tmp = zeros(1, 150);
for i = 1 : plen
    tmp(i) = Label_EEG(S(2, i), 1);
end
end