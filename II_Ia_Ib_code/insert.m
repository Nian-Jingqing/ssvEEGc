function Sj = insert(Sj, I)
len = 0;
for i = 1 : length(Sj)
    if(Sj(i) == 0)
       break;
    else
         len = len + 1;
    end
end
% disp(len)
for i = 1 : len
    if Sj(i) == I
        return;
    end
end

Sj(len + 1) = I;
end
