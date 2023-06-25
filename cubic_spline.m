
% Approximating function using conditional cubic splines
% a are the terms of degree 0 for each polinomial
% b are the terms of degree 1 for each polinomial
% c are the terms of degree 2 for each polinomial
% d are the terms of degree 3 for each polinomial

function [ coeficients ] = cubic_spline( X, Y, left_derivative, right_derivative )
    if( columns(X) <= 2 || columns(X) != columns(Y) )
        error("Incorrect Dimentions in cubic splin function")
    endif
    n = columns(X)-1; % Functions Number
    h = X(2:n+1) - X(1:n);
    a = Y;

    % Initializating A and b except first and last row
    A = zeros(n+1,n+1);
    b = zeros(n+1, 1);
    for i = 2 : n
        A( i, i ) = 2*(h(i) + h(i-1));
        A( i, i-1 ) = h(i-1);
        A( i, i+1 ) = h(i);
        b(i) = (3/h(i))*( a(i+1) - a(i) ) - (3/h(i-1))*( a(i) - a(i-1) );
    endfor
    % Creating first and last row
    A(1, 1) = 2*h(1);
    A(1, 2) = h(1);
    A(n+1, n ) = h(n);
    A(n+1, n+1 ) = 2*h(n);
    b(1) = (3/h(1))*( a(2) - a(1) ) - 3*left_derivative;
    b(n+1) = 3*right_derivative - (3/h(n))*( a(n+1) - a(n) );

    % Solving System and getting c
    c = A\b;
    
    % Now for b
    b = (h.^-1).*(a(2:n+1) - a(1:n)) - (h./3).*((c(2:n+1) + 2*c(1:n))');

    % and d
    d = (c(2:n+1) - c(1:n))' ./ (3*h);

    % Fixing c and a
    c = c(1:n)';
    a = a(1:n);

    coeficients = [ a;b;c;d ];
endfunction