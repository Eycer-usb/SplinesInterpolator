% Cliente principal de interpolacion por medio de splines cuadraticos y cubicos

v=input("Ingrese Vector de Absisas separadas por comas: X = ","s");
X=cellfun("str2num",strsplit(v,","))
v=input("Ingrese Vector de Ordenadas separadas por comas: Y = ","s");
Y=cellfun("str2num",strsplit(v,","))
d=str2num(input("Ingrese el grado del spline a utilizar en la interpolacion (2 o 3): d = ","s"));

if(d!=2 && d!=3)
    error("Incorrect degree for splin");
endif
if(d == 2)
    plot_spline(cuadratic_spline(X, Y), X, Y, d);
endif
if(d == 3)
    left_derivative=str2num(input("Ingrese la derivada en la frontera izquierda: S'0(X0) = ","s"));
    right_derivative=str2num(input("Ingrese la derivada en la frontera derecha: S'n(Xn+1) = ","s"));
    plot_spline(cubic_spline(X,Y, left_derivative, right_derivative), X, Y, d);
endif
fprintf("Finalizado\n");
