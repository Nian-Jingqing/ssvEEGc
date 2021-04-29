function delta = cmptsim(M, Sj, len)

sum = 0;
for u = 1 : len
    for v = 1 : len
        sum = sum + M(Sj(u), Sj(v));
    end
end

if len == 0 || len == 1
    delta = sum;
else
    delta = sum / (len * len - len);
end
% disp("delta = " + delta);
end

% 1.3024e+03