maxCount = 0;
m = 0;
maxNum = int64(0);
scale = int64(1);
    for n = int64(214)  %Number or numbers to test
        count = 0;
        m = 0;
        i = n;
        while (m ~= 4)
            i = numberEnglishLength(i);
            m = max(i);
            count = count + 1;
        end
        if (count > maxCount)
            maxCount = count;   % most steps needed out of tested numbers
            disp(maxCount);
            maxNum = int64(n);  % lowest tested number requiring the most steps
        end
    end


% longest number 7 777 777 777 777 777 777 (214)

% a count of 7 will appear with a lenth of 124
% 777 777 777 777 gives 130

% 777 777 777 720 gives 124 as 777 gives 27 720 gives a length of 21

% as does 720 777 777 777 as moving the 720 about within the standard 1e3
% groupings does not affect length

% as does 113 777 777 777 as 113 is the lowest number with lenght 21

% as does 113 373 373 373 as 373 is the lowest number with lenth 27

% as 27 is the longest any 3 digit number can be the lowest number with 214
% digits should be the lowest 27 length 3 digit number repeated until
% adding another will take it over 214 then adding the lowest number that
% will make up the length difference.

% Theoretically there could be a lower number which is longer but this does
% not appear to be the case

% 22 length smallest number is 117
% 23  length smalled number is 124

