function sigma = vote(Sj, len, I, M, K, alphaw, betaw)
% 返回标志
% % 第j类当前样本数（参与投票的人数）
% len = mylength(Sj);
% 计数器
cnt = 0;
% 样本总数
[n, ~] = size(M);
% 当前类簇相似度阈值
sim = cmptsim(M, Sj, len);

for i = 1 : len
    if M(Sj(i), I) < sim
        cnt = cnt + 1;  % 记一票
%         disp("M(" + Sj(i) + ", " + I + ") = " + M(Sj(i), I));
    end
end
% disp("vote res: " + cnt); 
% 参数更新
if len <= 10
    alpha = 0.8;
else
    alpha = cnt / len;
end

% beta = 0;
quarter = n / K;
beta = (quarter - len) / quarter;


% disp("alpha = " + alpha + ", beta = " + beta);
sigma = alphaw * alpha + betaw * beta;   
% disp("sigma = " + sigma);
% disp("-------------------------");
% if(cnt >= len * 0.6) % 超过6成评委赞成，通过面试
%         flag = 1;      
end