function sigma = vote(Sj, len, I, M, K, alphaw, betaw)
% ���ر�־
% % ��j�൱ǰ������������ͶƱ��������
% len = mylength(Sj);
% ������
cnt = 0;
% ��������
[n, ~] = size(M);
% ��ǰ������ƶ���ֵ
sim = cmptsim(M, Sj, len);

for i = 1 : len
    if M(Sj(i), I) < sim
        cnt = cnt + 1;  % ��һƱ
%         disp("M(" + Sj(i) + ", " + I + ") = " + M(Sj(i), I));
    end
end
% disp("vote res: " + cnt); 
% ��������
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
% if(cnt >= len * 0.6) % ����6����ί�޳ɣ�ͨ������
%         flag = 1;      
end