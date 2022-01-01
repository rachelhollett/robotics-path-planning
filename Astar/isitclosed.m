function result = isitclosed(neighbor,CLOSED) %check if neighbor is an element in CLOSED
result = 0;
i = 1;
while CLOSED(i) ~= 0
    if CLOSED(i) == neighbor
        result = 1;
    end
    i = i+1;
end
end