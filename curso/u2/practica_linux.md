---
layout: blog
tittle: Utilización de OpenStack en el IES Gonzalo Nazareno.  
menu:
  - Unidad 2
  - Unidades
---
## Práctica: Trabajar con Instancias Linux

El objetivo de esta práctica es realizar todo el proceso para crear una instancia con una distribución Linux, y acceder a ella utilizando claves SSH.
Trabajar con imágenes que tengan definida la contraseña del root no es conveniente ya que, si no tenemos la precaución de modificarla, cualquiera puede acceder a la instancia. Es por lo que lo normal es acceder a las intancias utilizando un par de claves ssh (privada/pública). En este caso la clave pública que vamos a generar la podemos inyectar en la instancia a la hora de crearla.

> **Imagen**: Imagen de sistema preconfigurado que se utiliza como base para crear instancias. Dentro del cloud podemos encontrar diferentes imágenes para cada tipo de instacia que se quiera utilizar.

Los pasos que tenemos que realizar son los siguientes:

1) Accede a **"horizon"** con la URL https://jupiter.gonzalonazareno.org e introduce el nombre de usuario y la contraseña que te han asignado.

2) Comprueba el proyecto al que perteneces.


3) Comprueba las imágenes que tenemos a nuestra disposición en el apartado **"Imágenes e instanteneas"**.

