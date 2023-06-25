figure;
grid on;
hold on;

% Leyendo imagen
im = imread('dataset/ProyectoSpline/usb1.jpg');
load dataset/ProyectoSpline/usb_puntos.mat;
imshow(im);
plot(x,y, 'r*');

% Curva parametrica
t = [1:1:66]; % parametro
p1 = spline(t, x);
p2 = spline(t, y);
tt = linspace(1,66,100);
xx = ppval(p1, tt);
yy = ppval(p2, tt);
plot(xx,yy, '-b');
