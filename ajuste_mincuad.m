% Function that approximates a n-degree polynomial to a data set of
% abscissa and ordinate X and Y received as parameters of the Function

function [answer] = ajuste_mincuad(X, Y, n)

    % Error Handling
    if( n > 25 || n > length(X) || length(X) != length(Y) )
        error('Invalid Arguments to ajuste_mincuad function');
    endif

    % Creating sums
    sums = zeros(1, 2*(n+1) - 1);

    % Main ecuation elements
    M = zeros(n+1, n+1);
    b = zeros(n+1, 1);

    % Initializating sums vector
    for i = 0:(columns(sums)-1)
        sums(i+1) = sum(X.^i);
    endfor

    % Filling Main matrix
    for row = 1:rows(M)
        new_row = sums(row : row + columns(M) - 1);
        M(row, :) = new_row;
    endfor

    % Calculation of vector b
    for i = 0:n
        b(i+1) = sum( Y.*X.^i );
    endfor

    % Solving the Linear ecuation
    % and returning polynomial coeficients in
    % descending degree order
    answer = flip(M\b);

endfunction
