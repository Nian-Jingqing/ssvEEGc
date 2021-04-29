function [y, S] = spveegc(EEG, K, S, M, alphaw, betaw)
% 拿到样本条数
[n, m] = size(EEG);
% 聚类结果
% 初始化为0， 和-1效果相同
y = zeros(n, 1);
% delta = (max(M,[],'all') + min(M, [], 'all')) / 2;
% delta = 2000;
% disp(delta);
for i = 1 : n
    % 第一类有类标样本，跳过
      
%     if i == 14 || i == 22 || i == 56 || i == 94 || i == 126 || i == 153 || i == 171 || i == 209 || i == 228 || i == 264
%         y(i) = 1;
%         continue;
%     end
%     % 第二类有类标样本，跳过
%     if i == 20 || i == 51 || i == 90 || i == 120 || i == 150 || i == 170 || i == 188 || i == 203 || i == 241 || i == 266
%         y(i) = 2;
%         continue;
%     end
    % 第一类有类标样本，跳过
    if contain(S(1, :), i) == 1
        y(i) = 1;
        continue;
    end
    % 第二类有类标样本，跳过
    if contain(S(2, :), i) == 1
        y(i) = 2;
        continue;
    end
    
%     disp("############################");
%     disp(i + "-th sample");
    priority = -999;
    label = 0;
    lenj = -1;
    for j = 1 : K
        Sj = S(j, :);  % 第j类评委席
        len = mylength(Sj);  % 评委人数
%         disp("cluster" + j + ", len = " + len);
        sigma = vote(Sj, len, i, M, K, alphaw, betaw);  % 投票表决
        if sigma > priority
            priority = sigma;
            label = j;
            lenj = len;
        end
    end 
    
   
    y(i) = label;  % 加入当前类
    S(label, lenj + 1) = i;  % 加入评委席
%     disp("set sample " + i + " as " + label + "-th cluster");
    
end

end
