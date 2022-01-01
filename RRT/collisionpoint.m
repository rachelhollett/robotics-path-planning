
function result = collisionpoint(x,y,obs) %checks if a point is in collision with any of the obstacles
result = 0;
obssize = size(obs);
numobs = obssize(1);

for i = 1:numobs %iterates through the obstacles and checks if the point is in collision
    if distance(x,y,obs(i,1),obs(i,2)) < 0.5 * obs(i,3)
        result = 1;
    end
end
end