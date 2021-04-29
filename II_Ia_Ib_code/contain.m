function hv = contain(S, I)
hv = 0;

len = mylength(S);

for i = 1 : len
    if S(i) == I
        hv = 1;
        return;
    end
end

end