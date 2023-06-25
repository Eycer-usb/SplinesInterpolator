function [minimum, maximum] = plot_spline(coeficients, X, Y, degree)
    if(degree != 2 && degree != 3)
        error("Incorrect spline degree");
    endif

    n = columns(X) - 1;
    if(degree == 2)
        a = coeficients(1,:);
        b = coeficients(2,:);
        c = coeficients(3,:);

        % Rewriting polinomial in the form ax^2 +bx + c
        a_1 = c;
        b_1 = b - 2*X(1:n).*c;
        c_1 = a - b.*X(1:n) + c.*(X(1:n).^2);

        % Plotting
        y = [];
        x = [];
        for i = 1 : n
            x_1 = X(i):0.001:X(i+1);
            y = [ y polyval([a_1(i) b_1(i) c_1(i)], x_1 )];
            x = [x x_1];
        endfor
        plot(x, y, '-b');
        hold on
        plot(X,Y,'*r');
        ym = min(y);
        xm = x(find(y==ym));
        yM = max(y);
        xM = x(find(y==yM));
        minimum = [xm, ym];
        maximum = [xM, yM];
        hold off
    endif

    if(degree == 3)
        a = coeficients(1, :);
        b = coeficients(2, :);
        c = coeficients(3, :);
        d = coeficients(4, :);

        % Rewriting polinomial in the form ax^2 +bx + c
        a_1 = d;
        b_1 = c - 3*X(1:n).*d;
        c_1 = b - 2*X(1:n).*c + 3*(X(1:n).^2).*d;
        d_1 = a - b.*X(1:n) + c.*(X(1:n).^2) - d.*(X(1:n).^3);

        % Plotting
        y = [];
        x = [];
        for i = 1 : n
            x_1 = X(i):0.001:X(i+1);
            y = [ y polyval([a_1(i) b_1(i) c_1(i) d_1(i)], x_1 )];
            x = [x x_1];
        endfor
        plot(x, y, '-b');
        hold on
        plot(X,Y,'*r');
        hold off
        ym = min(y);
        xm = x(find(y==ym));
        yM = max(y);
        xM = x(find(y==yM));
        minimum = [xm, ym];
        maximum = [xM, yM];
    endif


endfunction