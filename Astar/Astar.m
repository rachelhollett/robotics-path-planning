%takes a matrix of nodes and a matrix of edges and returns the lowest cost path between the first and last node
function [path] = Astar(edges,nodes) 
solutionfound = 0;

OPEN = zeros(10,2); %initialize the OPEN and CLOSED matrices
    OPEN(1,1) = 1;
CLOSED = zeros(20,1);
    closedcount = 1;

    nodessize = size(nodes);
    numnodes = nodessize(1);
pastcost = zeros(numnodes,1); %initialize the pastcost and parent matrices
    for i = 2:numnodes
        pastcost(i) = 1000;
    end
parent = zeros(numnodes,1);

while OPEN(1,1) ~= 0 %while OPEN has nodes in it explore the first one
    current = OPEN(1,1); %set the first node in OPEN to current and remove it from OPEN
    OPEN(1,:) = 0;
    OPEN = fixOPEN(OPEN); %moves all nonzero entries up one row
    CLOSED(closedcount) = current; %add the current node being explored to CLOSED
    closedcount = closedcount + 1;
    
    if current == numnodes %if node being explored is the goal node
        path = pathfinder(parent,numnodes); %calculates final path based on parent matrix
        solutionfound = 1; 
    end
    
        edgessize = size(edges);
        numedges = edgessize(1);
    for i = 1:numedges %search each row in edges to see if it involves current node
        [neighbor,cost] = neighborfinder(current,edges(i,:)); %returns neighbor and cost if current is one of the nodes on the edge, else returns 0
        if neighbor ~= 0 && isitclosed(neighbor,CLOSED) == 0 %figure out if neighbor is in CLOSED
            tentative = pastcost(current) + cost;
            if tentative < pastcost(neighbor) %change pastcost and parent of node being explored if tentative is an improvement
                pastcost(neighbor) = tentative;
                parent(neighbor) = current;
                OPEN = newneighbor(OPEN,neighbor,pastcost(neighbor)+nodes(neighbor,4)); %resort OPEN matrix 
            end
        end
    end   
end  
    if solutionfound == 0 %if a solution wasn't found return 1
        path = 1;
    end
writematrix(path,'path.csv'); %write the path matrix into a csv
end
