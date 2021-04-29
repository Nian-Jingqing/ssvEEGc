function len = mylength(Sj)
len = 0;
for i = 1 : length(Sj)
    if Sj(i) ~= 0
        len = len + 1;
    else
        break;
    end
end
end