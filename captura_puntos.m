% Utilidad de captura de puntos
figure;
grid on;
hold on;

% Leyendo imagen
im = imread('dataset/ProyectoSpline/usb1.jpg');
imshow(im);
[x, y] = ginput(65);
save dataset/ProyectoSpline/usb_puntos.mat x y