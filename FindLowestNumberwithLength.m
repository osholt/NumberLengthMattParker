
    for n = 1:1000      %range to check in
        i = numberEnglishLength(n);
        if i == 29      % letter length wanted
            break
        end
    end
    
% n will give you the lowest value of the numbers tested that has a letter
% length of i.