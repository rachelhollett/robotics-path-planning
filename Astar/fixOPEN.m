function new = fixOPEN(OPEN) %move all elements in OPEN up by one row

i = 1;
while OPEN(i+1,1) ~= 0
    OPEN(i,1) = OPEN(i+1,1);
    OPEN(i,2) = OPEN(i+1,2);
    i = i + 1;
end
OPEN(i,1) = 0;
OPEN(i,2) = 0;
new = OPEN;
end