%sorts the neighbor into the appropriate spot in the OPEN matrix based on esttotcost
function result = newneighbor(OPEN,neighbor,esttotcost)
    result = zeros(10,2);
    i = 1;
if OPEN(1,1) ~= 0 %if there is at least one node already in open
    while OPEN(i,2) < esttotcost && OPEN(i,1) ~= 0 %while esttotcost is greater than totcost of other nodes and there are still nodes to compare to
        result(i,1) = OPEN(i,1); %fill rows of result with rows of OPEN
        result(i,2) = OPEN(i,2);
        i = i + 1;
    end
    
    result(i,1) = neighbor; %stop filling result with OPEN and insert the new neighbor in the next row
    result(i,2) = esttotcost;
    i = i + 1;
    
    while OPEN(i-1,1) ~= 0
        result(i,1) = OPEN(i-1,1); %finish filling result with rows of OPEN
        result(i,2) = OPEN(i-1,2);
        i = i + 1;
    end
 
else
    result(1,1) = neighbor; %if OPEN was empty put the new neighbor in the first row 
    result(1,2) = esttotcost;
    
end
end
        
