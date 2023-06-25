% Programa cliente que carga los datos.mat y crea un spline cubico interpolador y 
% aproxima una curva por medio de ajuste de minimos cuadrados

fprintf("Cargando datos.mat...\n");
load dataset/ProyectoSpline/datos.mat
n = rows(x);
X_1 = x(1:11)';
X_2 = x(11:17)';
X_3 = x(17:n)';

Y_1 = y(1:11)';
Y_2 = y(11:17)';
Y_3 = y(17:n)';

subplot(1, 2, 1);
[minimo, maximo] = plot_spline(cubic_spline(X_1, Y_1, 0, fprima_en_x11_por_la_izquierda), X_1, Y_1, 3);
hold on
[m, M] = plot_spline(cubic_spline(X_2, Y_2, fprima_en_x11_por_la_derecha, fprima_bilateral_en_x17), X_2, Y_2, 3);
if(m(2) < minimo(2))
    minimo = m;
endif
if(M(2) > maximo(2))
    maximo = M;
endif
hold on 
[m, M] = plot_spline(cubic_spline(X_3, Y_3, fprima_bilateral_en_x17, 0), X_3, Y_3, 3);
hold on 
if(m(2) < minimo(2))
    minimo = m;
endif
if(M(2) > maximo(2))
    maximo = M;
endif
plot(minimo(1), minimo(2), 'ro');
plot(maximo(1), maximo(2), 'ro');

% Mostrando Minimo y maximo
fprintf("Minimo y Maximo de Splines:\n ")
minimo
maximo
hold off;
subplot(1, 2, 2);
% Interpolacion por ajuste de minimos cuadrados
fprintf("Minimo y Maximo de Ajuste por minimos cuadrados:\n ")
pol = ajuste_mincuad( x, y, 25 );
X = x(1):0.001:x(n);
Y = polyval(pol, X);
ym = min(Y);
xm = X(find(Y==ym));
minimo_2 = [xm, ym];
yM = max(Y);
xM = X(find(Y==yM));
maximo_2 = [xM, yM];

plot( X, Y, '-b');
hold on;
plot(x,y,'*r');
hold on;
plot(minimo_2(1), minimo_2(2),'ro');
plot(maximo_2(1), maximo_2(2),'ro');
hold off;

fprintf("Finalizado\n");