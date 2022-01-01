%takes a matrix of obstacles and finds a path from (-0.5,-0.5) to (0.5,0.5)
%using the RRT path algorithm
%also generates matrices of the nodes and edges created during the path
%search process
function [path,edges,nodes] = RRTplanner(obstacles) 
pathfound = 0;

nodes = zeros(1000,3); %initialize nodes matrix and add first node at start
nodes(1,1) = 1;
nodes(1,2) = -0.5;
nodes(1,3) = -0.5;
numnodes = 1;

edges = zeros(1000,3); %initialize edges and parent matrix
parent = zeros(1000,1);

while numnodes <= 1000 && pathfound == 0 
    xsamp = rand - 0.5; %generate a random point in the space
    ysamp = rand - 0.5;
    
    random = rand;
    if random < 0.1 %10 percent chance of point being goal point
        xsamp = 0.5;
        ysamp = 0.5;
    end
    
    if collisionpoint(xsamp,ysamp,obstacles) == 0 %if point not in collision
        [index,xnearest,ynearest] = nearest(xsamp,ysamp,nodes,numnodes); %find the nearest node to the sampled point
    
        if collisionline(xsamp,ysamp,xnearest,ynearest,obstacles) == 0 %make sure path from sampled point to nearest node doesn't intersect an obstacle
            numnodes = numnodes + 1;
            nodes(numnodes,1) = numnodes; %add sampled node to nodes
            nodes(numnodes,2) = xsamp;
            nodes(numnodes,3) = ysamp;
            
            edges(numnodes - 1,1) = index; %add edge from sampled point to nearest point
            edges(numnodes - 1,2) = numnodes;
            edges(numnodes - 1,3) = distance(xsamp,ysamp,xnearest,ynearest);
            
            parent(numnodes) = index; %parent node of sampled point is nearest point
            
            if xsamp == 0.5 && ysamp == 0.5 %if sampled point is goal point a path has been found
                pathfound = 1;
                path = pathfinder(parent,numnodes);
            end
        end   
    end   
end

edges = nozeros(edges); %removes extra zeros from edges and nodes matrix since we didn't know how many nodes would be needed to find solution
nodes = nozeros(nodes);

writematrix(edges,'edges.csv');
writematrix(nodes,'nodes.csv');
writematrix(path,'path.csv');

end