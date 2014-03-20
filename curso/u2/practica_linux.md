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

**Par de claves ssh**: Utilizadas para acceder por ssh a las instancias desde fuera del cloud.

4) Antés de crear la instancia vamos a crear nuestra par de claves, desde la sección **"Acceso y Seguidad"** -> **"Par de claves"** -> **"Crear par de claves"**: creaa un par de claves y guárdalo en tu ordenador y asígnale los permisos adecuado (chmod 600).

**Instancia**: Clon de una imagen que se crea a demanda del usuario en uno de los nodos del cloud.
**Un sabor (flavor)**: Define para una instancia el número de CPUs virtuales, la RAM, si dispone o no de discos efímeros, etc.

5) Crea una instancia de la imagen (**"Instancias"** -> **"Lanzar Instancia"**).

Los datos necesarios para crear la instancia son los siguientes:

* **Origen de la instancia**: Puede ser Imagen o Instantanea, elegimos la primera opción.
* **Imagen**: Podemos elegir de la lista de imágenes disponibles. Vamos a hacer una instancia a partir de la imagen **"Debian 7.2 (Wheezy)"**.
* **Nombre** de la instancia
* El **sabor** de la máquina que vamos a crear.
* Número de instancia, por defecto 1.
* El par de **claves SSH** con el que vamos a acceder a la instancia.
* La red a la que está conectada nuestra instancia.

Accede a ella utilizando la consola VNC, para ello pulsa sobre el nombre de la instancia (desde el apartado **"Instancias"**) y a la pestaña **"Consola"**.

**IP fija**: Dirección IP con la que se crean las instancias y que se utiliza para comunicación interna.
**IP flotante**: Dirección IP que puede asociarse a diferentes instancias con el fin de acceder a ellas desde fuera.

6) Cuando se crea, la instancia ha tomada una ip fija de la red a la que está conectada.

7)  Para poder acceder a nuestra instancia desde el exterior tenemos que asignarle a la instancia una IP flotante, para ello desde el apartado **"Acceso y Seguridad"**->**"IP Flotante"** solicita una nueva IP flotante (**Asignar IP al proyecto**) y asígnala a la instancia que has creado.

**Grupo de seguridad**: Reglas de cortafuegos (iptables) que controlan el acceso a las instancias mediante la dirección IP flotante.

8) También es necesario abrir el puerto 22 en el Grupo de seguridad default (**"Acceso y Seguridad"**->**"Grupos de Seguridad"**). Edita las reglas y añade una nueva en la que permitas el acceso por el puero 22 desde la IP de tu ordenador.

9) Por último, utilizando un cliente ssh (open shh client o putty) accede a la instancia utilizando la ip flotante que le hemos asignado a la instancia. Por ejemplo:

        ssh -i .ssh/vostro.pem ubuntu@172.22.200.63

10) Una vez que has trabajado un poco con la intancia, practica las distintas operaciones que puedes hacer sobre ella: pausar, suspender, reiniciar, terminar, ...

11) Una vez que hemos accedido a la instancia podemos comprobar varias cosas:

* El nombre de la máquina es el nombre que le hemos dado a la instancia (cat /etc/hostname).
* Según el sabor que hemos elegido tenemos dos discos duros: vda, donde tenemos intalado el sistema, y vdb, un disco duro "efímero" que debemos particionar y formatear para utilizarlo. Puede comprobarlo ejecutando: sudo fdisk -l
* También podemos comprobar que la máquina tiene 1 GB de RAM, ejecuta el comando free.
