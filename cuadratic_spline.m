
% Approximating function using cubic splines
% a are the terms of degree 0 for each polinomial
% b are the terms of degree 1 for each polinomial
% c are the terms of degree 2 for each polinomial

function [coeficients] = cuadratic_spline(X, Y)
    if( columns(X) < 2 || columns(X) != columns(Y) )
        error("Incorrect Dimentions in cuadratic splin function")
    endif
    n = columns(X) - 1;
    a = Y(1:n);
    h = X(2:n+1) - X(1:n);
    u = Y(2:n+1) - Y(1:n);
    d = u./h;
    A = zeros(n, n);
    t = [ [0], d(2:n) - d(1:n-1) ];
    A(1,1) = 1;
    for i = 2 : n 
        A(i, i-1) = h(i-1);
        A(i, i) = h(i);
    endfor
    c = (A\(t'))';
    b = u./h - c.*h;

    coeficients = [ a; b; c ];

    

% Proof: [a b c ] = cuadratic_spline([1 3 6], [1 5 8])