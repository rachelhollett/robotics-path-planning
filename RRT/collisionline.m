
function result = collisionline(x1,y1,x2,y2,obs) %checks if a line segment intersects any of the obstacles
result = 0;

diffx = x2 - x1;
diffy = y2 - y1;
incx = diffx/100;
incy = diffy/100;

for i = 1:100 %iterates through 100 points evenly spaced along the segment and checks if they are in collision
    x = x1 + (incx * i);
    y = y1 + (incy * i);
    
    if collisionpoint(x,y,obs) == 1
        result = 1;
    end
end
end
