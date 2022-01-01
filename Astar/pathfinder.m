function path = pathfinder(parent,numnodes) %finds the final path based on the parent matrix
    bigmatrix = zeros(1,1000);
    bigmatrix(1000) = numnodes;
    currentnode = numnodes;
    i = 999;
    
    while currentnode ~= 1 %fill the oversized matrix with the path by backtracking from the last node
        bigmatrix(i) = parent(currentnode);
        currentnode = bigmatrix(i);
        i = i - 1;
    end
    
    path = zeros(1,1000-i); %create a matrix of correct path size based on how many elements added to bigmatrix
    i = i + 1;
    j = 1;
    
    while i < 1001 %fill path matrix with path elements from bigmatrix
        path(j) = bigmatrix(i);
        i = i + 1;
        j = j + 1;
    end
end
    