function [neighbor,cost] = neighborfinder(current,edge) %if current is a node on the edge, return the other node and the cost of the path
neighbor = 0;
cost = 0;
    if current == edge(1)
        neighbor = edge(2);
        cost = edge(3);
    end
    
    if current == edge(2)
        neighbor = edge(1);
        cost = edge(3);
    end
end