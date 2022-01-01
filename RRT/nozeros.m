
function result = nozeros(m) %removes extra zeros from unused rows of edges and nodes matrices
    bigmatrix = zeros(1000,3);
    i = 1;
    while m(i,1) ~= 0
        bigmatrix(i,1) = m(i,1);
        bigmatrix(i,2) = m(i,2);
        bigmatrix(i,3) = m(i,3);
        i = i + 1;
    end
    
    i = i - 1;
    result = zeros(i,3);
    
    for j = 1:i
        result(j,1) = bigmatrix(j,1);
        result(j,2) = bigmatrix(j,2);
        result(j,3) = bigmatrix(j,3);
    end
end