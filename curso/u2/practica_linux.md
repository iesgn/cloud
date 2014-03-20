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

|-|-|
|**Par de claves ssh**|Utilizadas para acceder por ssh a las instancias desde fuera del cloud.|

Los pasos que tenemos que realizar son los siguientes:

1) Accede a **"horizon"** con la URL https://jupiter.gonzalonazareno.org e introduce el nombre de usuario y la contraseña que te han asignado.

2) Comprueba el proyecto al que perteneces.



3) Lo primero que tenemos que hacer es crear nuestra par de claves, desde la sección **"Acceso y Seguidad"** -> **"Par de claves** -> **"Crear par de claves": creaa un par de claves y guárdalo en tu ordenador y asígnale los permisos adecuado (chmod 600).


