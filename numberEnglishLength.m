function [ count ] = numberEnglishLength( numIn)
%numberEnglishLength takes a number and returns how many non-whitespace or
%punctuation characters are in the number in English (UK).
count = 0;
num = int64(numIn);


[num, count] = NELquintillions(num, count);

[num, count] = NELquadrillions(num, count);

[num, count] = NELtrillions(num, count);

[num, count] = NELbillions(num, count);

[num, count] = NELmillions(num, count);

[num, count] = NELthousands(num, count);

[num, count] = NELhundreds(num, count);

[num, count] = NELtens(num, count);

[~, count] = NELunits(num, count);

end

function [ num, count ] = NELquintillions(numIn, countIn)
% Generates length for quintillions part of the number and adds it to the
% running total and then subtracts any quintillions from the number.
    if ((numIn < 1e21) && (numIn >= 1e18))
        count = countIn + 11;
        quintillions = idivide(int64(mod(numIn, 1e21)), int64(1e18), 'floor');
        
        num = numIn - quintillions*1e18;
        
        [quintillions, count] = NELhundreds(quintillions, count);
        [quintillions, count] = NELtens(quintillions, count);
        [~, count] = NELunits(quintillions, count);
    
    else
        num = numIn;
        count = countIn;
    end
end

function [ num, count ] = NELquadrillions(numIn, countIn)
% Generates length for quadrillions part of the number and adds it to the
% running total and then subtracts any quadrillions from the number.
    if ((numIn < 1e18) && (numIn >= 1e15))
        count = countIn + 11;
        quadrillions = idivide(int64(mod(numIn, 1e18)), int64(1e15), 'floor');
        
        num = numIn - quadrillions*1e15;
        
        [quadrillions, count] = NELhundreds(quadrillions, count);
        [quadrillions, count] = NELtens(quadrillions, count);
        [~, count] = NELunits(quadrillions, count);
    
    else
        num = numIn;
        count = countIn;
    end
end

function [ num, count ] = NELtrillions(numIn, countIn)
% Generates length for trillions part of the number and adds it to the
% running total and then subtracts any trillions from the number.
    if ((numIn < 1e15) && (numIn >= 1e12))
        count = countIn + 8;
        trillions = idivide(int64(mod(numIn, 1e15)), int64(1e12), 'floor');
        
        num = numIn - trillions*1e12;
        
        [trillions, count] = NELhundreds(trillions, count);
        [trillions, count] = NELtens(trillions, count);
        [~, count] = NELunits(trillions, count);
    
    else
        num = numIn;
        count = countIn;
    end
end

function [ num, count ] = NELbillions(numIn, countIn)
% Generates length for billions part of the number and adds it to the
% running total and then subtracts any billions from the number.
    if ((numIn < 1e12) && (numIn >= 1e9))
        count = countIn + 7;
        billions = idivide(int64(mod(numIn, 1e12)), int64(1e9), 'floor');
        
        num = numIn - billions*1e9;
        
        [billions, count] = NELhundreds(billions, count);
        [billions, count] = NELtens(billions, count);
        [~, count] = NELunits(billions, count);
    
    else
        num = numIn;
        count = countIn;
    end
end

function [ num, count ] = NELmillions(numIn, countIn)
% Generates length for millions part of the number and adds it to the
% running total and then subtracts any millions from the number.
    if ((numIn < 1e9) && (numIn >= 1e6))
        count = countIn + 7;
        millions = idivide(int64(mod(numIn, 1e9)), int64(1e6), 'floor');
        
        num = numIn - millions*1e6;
        
        [millions, count] = NELhundreds(millions, count);
        [millions, count] = NELtens(millions, count);
        [~, count] = NELunits(millions, count);
    
    else
        num = numIn;
        count = countIn;
    end
end

function [ num, count ] = NELthousands(numIn, countIn)
% Generates length for thousands part of the number and adds it to the
% running total and then subtracts any thousands from the number.
    if ((numIn < 1000000) && (numIn >= 1000))
        count = countIn + 8;
        thousands = idivide(int64(mod(numIn, 1000000)), int64(1000), 'floor');
        
        num = numIn - thousands*1000;
        
        [thousands, count] = NELhundreds(thousands, count);
        [thousands, count] = NELtens(thousands, count);
        [~, count] = NELunits(thousands, count);
    
    else
        num = numIn;
        count = countIn;
    end
end

function [ num, count ] = NELhundreds(numIn, countIn)
% Generates length for hundreds part of the number and adds it to the
% running total and then subtracts any hundreds from the number.
    if ((numIn < 1000) && (numIn >= 100))
        count = countIn;
        hundreds = idivide(int64(mod(numIn, 1000)), int64(100), 'floor');
        if (mod(numIn, 100) == 0) %accounts for 'and'
            count =  count +7; 
        else 
            count = count + 10;
        end

        [~, count] = NELunits(hundreds, count);
        
        num = numIn - hundreds*100;
    else
        num = numIn;
        count = countIn;
    end
end
    

function [ num, count ] = NELtens(numIn, countIn)
% Generates length for tens part of the number and adds it to the
% running total and then subtracts any tens from the number.
    if ((numIn < 100) && (numIn >= 16))
        count = countIn;
        tens = idivide(int64(mod(numIn, 100)), int64(10), 'floor');
        switch tens
            case 1
                count = count + 4;
            case 2
                count = count + 6;
            case 3
                count = count + 6;
            case 4
                count = count + 6;
            case 5
                count = count + 5;
            case 6
                count = count + 5;
            case 7
                count = count + 7;
            case 8
                count = count + 6;
            case 9
                count = count + 6;
        end
        num = numIn - tens*10;
    else
        num = numIn;
        count = countIn;

    end
end

function [ num, count ] = NELunits(numIn, countIn)
% Generates length for units (and irregular teens) part of the number and adds it to the
% running total and then subtracts any units(and irregular teens)from the number.
    if (numIn < 16)
        count = countIn;
        units = mod(numIn, 16);
        switch units
            case 0
                count = count + 0;
            case 1
                count = count + 3;
            case 2
                count = count + 3;
            case 3
                count = count + 5;
            case 4
                count = count + 4;
            case 5
                count = count + 4;
            case 6
                count = count + 3;
            case 7
                count = count + 5;
            case 8;
                count = count + 5;
            case 9
                count = count + 4;
            case 10;
                count = count + 3;
            case 11
                count = count + 6;
            case 12
                count = count + 6;
            case 13
                count = count + 8;
            case 14
                count = count + 8;
            case 15
                count = count + 7;
        end
        num = numIn - units;
     else
        num = numIn;
        count = countIn;
    end    
end

