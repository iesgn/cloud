---
layout: blog
tittle: Introducción a PaaS. OpenShift
menu:
  - Unidad 9
---

## OpenShift por dentro. Conceptos avanzados

En esta sección vamos a ver algunas de las características internas de OpenShift
viendo qué usuario ejecuta las aplicaciones, los permisos que tiene y las
peculiaridades de utilizar un entorno compartido como éste.

### Direccionamiento exterior

Podemos ver que cada una de nuestras aplicaciones está asociada a una dirección
IP de una instancia de Amazon EC2:
		
    $ dig aplicacion-iesgn.rhcloud.com
	
    ; <<>> DiG 9.8.4-rpz2+rl005.12-P1 <<>> aplicacion-iesgn.rhcloud.com
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 21146
    ;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 0
	
    ;; QUESTION SECTION:
    ;aplicacion-iesgn.rhcloud.com.	IN	A
	
    ;; ANSWER SECTION:
    aplicacion-iesgn.rhcloud.com. 60 IN	CNAME	ex-std-node298.prod.rhcloud.com.
    ex-std-node298.prod.rhcloud.com. 150 IN	CNAME	ec2-174-129-158-197.compute-1.amazonaws.com.
    ec2-174-129-158-197.compute-1.amazonaws.com. 603962 IN A 174.129.158.197
	
Como podemos observar nuestra FQDN corresponde con un alias (registro CNAME) del
servidor *ex-std-node298.prod.rhcloud.com*, que vuelve a ser un alias de otro
servidor que es una instancia que se esta ejecutando en amazon EC2 que tiene
como IPv4 pública la dirección 174.129.158.197.

Si repetimos esto para otras aplicaciones del mismo espacio de nombres o de
otros espacios de nombre del dominio rhcloud.com, comprobaremos que se obtienen 
diferentes direcciones IPv4, lo que nos indica que en realidad OpenShift Online
son un conjunto de instancias que se están ejecutando sobre Amazon EC2 y que
ubican cada instancia en cada momento donde más conviene.

OpenShift, o en general cualquier software que proporcione PaaS, no tiene por
qué ejecutarse sobre una capa de IaaS como en este caso, también podría
ejecutarse sobre máquinas virtuales o físicas, aunque en este caso IaaS
proporciona una enorme ventaja ya que el número de instancias que se estén
ejecutando en cada instante (y por tanto pagando por ellas) estará ajustado en
todo momento a las necesidades.

### Acceso por ssh

Al crear una aplicación con OpenShift, se nos facilita una cadena de conexión a
través de ssh del tipo *5383412ce0b8cd98650000ae@aplicacion-iesgn.rhcloud.com*,
que podremos utilizar desde un equipo donde tengamos nuestra clave ssh:

    ssh 5383412ce0b8cd98650000ae@aplicacion-iesgn.rhcloud.com

Esto supone una importante ventaja respecto a otras opciones de despliegue de
aplicaciones web, ya que podemos obtener información precisa y directa de lo que
está ocurriendo en nuestra aplicación.

### Características de la máquina

Si accedemos por ssh podemos comprobar que se trata de una máquina donde se está
compartiendo los recursos entre los distintos gear creados por diferentes
usuarios de OpenShift. Por ejemplo podemos obtener información de la memoria RAM
de este  equipo, el almacenamiento o las características del procesador:

    > free
    > df -h
    > cat /proc/cpuinfo 

El directorio home del usuario es /var/lib/openshift/$UUID y tiene el siguiente
contenido (obviamente variará en función de los *cartridges* instalados, en este
caso php y mysql):

    drwxr-xr-x.  4 5383412ce0b8cd98650000ae 5383412ce0b8cd98650000ae 4096 may 26 09:31 app-deployments
    drwxr-xr-x.  5 root                     5383412ce0b8cd98650000ae 4096 may 26 09:27 app-root
    drwxr-xr-x.  3 root                     root                     4096 may 26 09:27 git
    drwxr-xr-x. 12 5383412ce0b8cd98650000ae 5383412ce0b8cd98650000ae 4096 may 26 09:28 mysql
    drwxr-xr-x. 11 5383412ce0b8cd98650000ae 5383412ce0b8cd98650000ae 4096 may 26 09:27 php

### Procesos asociados a cada gear

Una característica interesante de OpenShift es que, a diferencia de una
aplicación desplegada en hosting compartido, en cada gear se ejecutan procesos
propios para cada aplicación utilzando los recusos asignados:

    > ps -A
       PID TTY          TIME CMD
    309168 ?        00:00:00 control
    309173 ?        00:00:00 scl
    309174 ?        00:00:00 bash
    309177 ?        00:00:00 mysqld_safe
    309178 ?        00:00:00 logshifter
    309762 ?        00:00:24 mysqld
    310670 ?        00:00:01 httpd
    310671 ?        00:00:00 logshifter
    310699 ?        00:00:00 tee
    310711 ?        00:00:00 tee
    310723 ?        00:00:00 httpd
    313231 ?        00:00:00 httpd
    504385 ?        00:00:00 sshd
    504386 pts/0    00:00:00 bash
    509935 pts/0    00:00:00 ps

### Direccionamiento interno

Si vemos la dirección IP que tiene asignada la interfaz de red eth0: 

    > /sbin/ifconfig eth0     
	Link encap:Ethernet  HWaddr 22:00:0A:1D:E8:DF  
    inet addr:10.29.232.223  Bcast:10.29.232.255  Mask:255.255.255.192
    UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
    RX packets:1292114277 errors:0 dropped:0 overruns:0 frame:0
    TX packets:1051081845 errors:0 dropped:0 overruns:0 carrier:0
    collisions:0 txqueuelen:1000 
    RX bytes:693208456730 (645.6 GiB)  TX bytes:988542163018 (920.6 GiB)
    Interrupt:15 

En este caso podemos observar que la máquina donde se están ejecutando los
distintos gear de distintos usuarios tiene una dirección IP que en este caso
corresponde con la 10.29.232.223.

### Procesos, puertos e interfaces loopback

Tenemos una máquina en la que distintos usuarios no privilegiados están
ejecutando procesos iguales o muy similares: servidores web, servidores de
aplicaciones o servidores de bases de datos. Cada uno de ellos debe tener un
socket único del tipo <dirección IP>:<puerto>, donde el puerto no puede ser
inferior al 1024 al tratarse de procesos ejecutados por usuarios no
privilegiados del sistema.

La solución utilizada por OpenShift es utilizar una dirección IP del rango
127.0.0.0/8 para cada cartridge y utilizar puertos estándar para los servicios
(3306 para MySQL, 8080 para httpd, etc.). Aunque habitualmente sólo se utiliza
la dirección IP 127.0.0.1 asociada al nombre localhost, cualquier dirección IP
del rango 127.0.0.0/8 está asociada a la interfaz de loopback, por lo que puede
utilizarse internamente y proporciona un socket TCP/IP único.

**Nota:** Prueba a hacer ping a cualquier dirección IP del rango 127.0.0.0/8

Veamos a continuación las direcciones IP que corresponden a un gear en
concreto mediante las variables de entorno definidas:

    > env | grep _IP
    OPENSHIFT_PHP_IP=127.5.215.1

Esta es la dirección desde la que el servidor web esta ofreciendo su servicio en
el puerto 8080. 

    > env | grep OPENSHIFT_MYSQL_DB_HOST
    OPENSHIFT_MYSQL_DB_HOST=127.5.215.2

Esta es la dirección desde la que el servidor de base de datos esta ofreciendo
su servicio en el puerto 3306.

Como podemos observar para cada gear que se ejecuta en nuestra máquina se van
reservando direcciones de loopback que están en el rango de 127.0.0.0/8. Para
ver las direcciones IP que se han reservado para los procesos que se ejecutan en
esta máquina podemos ejecutar la siguiente instrucción:

    >  netstat -utan | grep 127.

Y para ver los conexiones que tiene establecida mi gear podemos ejecutar:

    >  netstat -utan | grep $OPENSHIFT_PHP_IP
    tcp        0      0 127.5.215.1:8080            0.0.0.0:*                   LISTEN
	
    > netstat -utan | grep $OPENSHIFT_MYSQL_DB_HOST
    tcp        0      0 127.5.215.2:3306            0.0.0.0:*                   LISTEN  


También podemos observar que hay dos proceso (que no nos pertenecen) ejecutándose
en los puertos 80/tcp y 443/tcp:

    > netstat -utan|grep "0.0.0.0:80\|0.0.0.0:443"
	tcp        0      0 0.0.0.0:80                  0.0.0.0:*                   LISTEN
	tcp        0      0 0.0.0.0:443                 0.0.0.0:*                   LISTEN

Es a este servidor web al que accedemos desde el exterior mediante http o https
y él se encarga de redirigir nuestra petición al servidor asociado al nombre de
nuestra aplicación, ya que está funcionado en modo "proxy inverso".

### Análisis de los registros (logs)

Podemos acceder a los logs de los servicios que tenemos instalado en nuestro
gear en el directorio app-root/logs:

    [aplicacion-iesgn.rhcloud.com logs]\> ls
    mysql.log  php.log

Que nos permite depurar de forma precisa cualquier error que ocurra durante el
despliegue o ejecución de nuestra aplicación.

