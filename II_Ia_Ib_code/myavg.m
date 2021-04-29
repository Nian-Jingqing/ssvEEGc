function navg = myavg(FS_V)
cnt = 10;
for i = 1 : 10
    if isnan(FS_V(i))
        FS_V(i) = 0;
        cnt = cnt - 1;
    end
end

navg = sum(FS_V) / cnt;