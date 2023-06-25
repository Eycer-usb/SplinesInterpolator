# SplinesInterpolator
Para este proyecto se trabajó intensivamente sobre las utilidades de los splines y
sus propiedades para interpolar conjuntos de puntos dados de la mejor manera posible. Con
los conocimientos matemáticos adquiridos en el curso y en cursos anteriores. A
continuación una explicación de las funcionalidades implementadas.

## Ajuste_mincuad.m
Se implementa el ajuste de una curva a un conjunto de puntos por medio de
minimización del error cuadrático. Se toma encuenta que el grado del polinomio a ajusta no
puede ser mayor a 25 como se solicita en el enunciado facilitado.
Cuadratic_spline.m y Demostracion Spline Cuadratico.pdf
En el documento pdf titulado Demostración Spline Cuadrático se hizo la
demostración matemática del sistema de ecuaciones general asi como los resultados
teoricos necesarios para generar splines interpolantes cuadráticos.
Luego en este archivo cuadratic_spline.m se pone en practica dichos resultados
teóricos y se retorna una matriz de coeficientes que corresponden a los coeficientes de los
polinomios en cada trozo.

## Cubic_spline.m
Similar a la función del spline cuadrático, en este archivo se crea la función de
interpolación de puntos por medio de splines, sin embargo esta vez se realiza con
polinomios cúbicos en vez de cuadráticos. Adicionalmente la función recibe dos parámetros
que corresponden a los valores de las derivadas en en las fronteras laterales del spline.

## plot_spline.m
Función de graficación de splines. Esta recibe los coeficientes del spline, los puntos
interpolados y el grado del spline. Este se encargará de graficar los puntos y evaluar el
spline proporcionado en el rango determinado por los puntos recibidos.

## interp_splines.m
Programa cliente para probar el correcto funcionamiento de las funciones del spline
cuadrático, cúbico y de la función de graficación. Esta le solicita al usuario el conjunto de
puntos a interpolar y el grado del spline (cuadrático o cúbico). De recibir un grado cúbico se solicita adicionalmente las condiciones de frontera.

## minmax.m
De acuerdo con las especificaciones recibidas este es un script que lee un conjunto
de puntos a partir del archivo datos.m halla y gráfica por separado las dos funciones de
aproximación encontradas por medio de las funciones de ajuste por mínimos cuadrados y
mediante splines cúbicos y en ambos gráficos incluye el conjunto de puntos. Además se
imprime por la salida estándar los máximos y mínimos globales de cada función. Estos
minimos se marcan en cada grafico con circulos de color rojo.

## captura_puntos.m
Este script se realizó para facilitar la captura de puntos a partir de la imagen usb1.jpg
provista. El script captura 65 puntos y los almacena en el archivo usb_puntos.mat.

## parametric_map.m
Script que a partir de la imagen usb1.jpg y los puntos almacenados en el archivo
usb_puntos.m realiza el ajuste de una curva parametrizada que de la imagen satelital del
campus de la usb interpole una función que encierre la avenida principal del campus.