# reconstruccion_imagenes_medicas_ultrasonido
Proyecto de tesis de Martín Baggio - Ingeniería de Sonido (untref)

Este código fue desarrollado para cuantificar, por medio de descriptores objetivos localizados, distintos algoritmos de reconstrucción de imágenes utilizando transformada wavelet. El mismo está diseñado para reducir el ruido tipo speckle de las imágenes de ecógrafos. 

Las imágenes de ecógrafos que aquí dejo pertenecen a un estudio de un fantoma Gammex 403 GS LE obtenido mediante un ecógrafo Esaote MyLab 25.

El programa fue desarrollado en Matlab y consta de cuatro interfaces gráficas, donde la primera pertenece al ingreso de las imágenes y elección de algoritmos de reconstrucción. En la segunda pantalla se ingresan los umbrales wavelet que serán aplicados. La tercer parte, se determinan las zonas de análisis las cuáles se aplicarán los descriptores. Por último, se muestran los resultados con gráficos de tendencia, pudiendo navegar a través de los distintos umbrales utilizados y exportando los mismos para su registro. 
