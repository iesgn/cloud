---
layout: blog
tittle: Introducción a PaaS. OpenShift
menu:
  - Unidad 9
---

## OpenShift por dentro. Conceptos avanzados

### Acceso por ssh

Una vez que tenemos creado nuestro gear, y accediendo desde un equipo donde tengamos nuestra clave ssh, podemos acceder por ssh a la máquina donde se esta ejecutando nuestro gear:

        ssh 5383412ce0b8cd98650000ae@aplicacion-iesgn.rhcloud.com

Hay que tener claro que estamos accediendo a una máquina done se esta compartiendo los recursos entre los distintos gear creados por distintos usuario de OpenShift. Por ejemplo podemos obtener información de la memoria RAM de este equipo, el almacenamiento o las características del procesador:

        [aplicacion-iesgn.rhcloud.com 5383412ce0b8cd98650000ae]\> free
        [aplicacion-iesgn.rhcloud.com 5383412ce0b8cd98650000ae]\> df -h
        [aplicacion-iesgn.rhcloud.com 5383412ce0b8cd98650000ae]\> cat /proc/cpuinfo 

El directorio home del usuario es /var/lib/openshoft/$UUID y tiene el siguiente contenido:

        drwxr-xr-x.  4 5383412ce0b8cd98650000ae 5383412ce0b8cd98650000ae 4096 may 26 09:31 app-deployments
        drwxr-xr-x.  5 root                     5383412ce0b8cd98650000ae 4096 may 26 09:27 app-root
        drwxr-xr-x.  3 root                     root                     4096 may 26 09:27 git
        drwxr-xr-x. 12 5383412ce0b8cd98650000ae 5383412ce0b8cd98650000ae 4096 may 26 09:28 mysql
        drwxr-xr-x. 11 5383412ce0b8cd98650000ae 5383412ce0b8cd98650000ae 4096 may 26 09:27 php


### Procesos asociados a cada gear

Si es importante indicar que los procesos que ejecuta cada gear están aislado del resto de los gear, por lo tanto podemos ver los procesos que se están ejecutando en nuestro gear:

        [aplicacion-iesgn.rhcloud.com 5383412ce0b8cd98650000ae]\> ps -A
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



### Direccionamiento de nuestra aplicación

En este apartado vamos a estudiar las distintas direcciones que entran en juego en nuestra aplicación. Por un lado vamos a ver la dirección pública a la que corresponde la URL de nuestra aplicación:

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

Como podemos observar nuestra FQDN corresponde con un alias (registro CNAME) del servidor *ex-std-node298.prod.rhcloud.com*, que vuelve a ser un alias de otro servidor que es una instancia que se esta ejecutando en amazon EC2 que tiene como "ip flotante" la 174.129.158.197

A continuación accedemos a nuestro gear, y vemos la dirección ip que tiene configurada su intefaz de red:

        [aplicacion-iesgn.rhcloud.com 5383412ce0b8cd98650000ae]\> /sbin/ifconfig 
        eth0      Link encap:Ethernet  HWaddr 22:00:0A:1D:E8:DF  
                  inet addr:10.29.232.223  Bcast:10.29.232.255  Mask:255.255.255.192
                  UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
                  RX packets:1292114277 errors:0 dropped:0 overruns:0 frame:0
                  TX packets:1051081845 errors:0 dropped:0 overruns:0 carrier:0
                  collisions:0 txqueuelen:1000 
                  RX bytes:693208456730 (645.6 GiB)  TX bytes:988542163018 (920.6 GiB)
                  Interrupt:15 

En este caso podemos observar que la máquina donde se están ejecutando los distintos gear de distintos usuarios tiene una ip fija que en este caso corresponde con la 10.29.232.223.

Veamos a continuación las direcciones ip que corresponden a un gear en concreto. Para ver esta ip podemos ver dos variables de entorno que están definidas:

        [aplicacion-iesgn.rhcloud.com 5383412ce0b8cd98650000ae]\> env | grep _IP
        OPENSHIFT_PHP_IP=127.5.215.1

Esta es la dirección desde la que el servidor web esta ofreciendo su servicio en el puerto 8080.

        [aplicacion-iesgn.rhcloud.com 5383412ce0b8cd98650000ae]\> env | grep OPENSHIFT_MYSQL_DB_HOST
        OPENSHIFT_MYSQL_DB_HOST=127.5.215.2

Esta es la dirección desde la que el servidor de base de datos esta ofreciendo su servicio en el puerto 3306.

Como podemos observar para cada gear que se ejecuta en nuestra máquina se van reservando direcciones de loopback que están en el rango de 127.0.0.0/8. Para ver las direcciones de loopback que se han reservado para los distintos gear que se ejecutan en esta máquina podemos ejecutar la siguiente instrucción:

        [aplicacion-iesgn.rhcloud.com 5383412ce0b8cd98650000ae]\>  netstat -utan | grep 127.

Y para ver los conexiones que tiene establecida mi gear podemos ejecutar:

        [aplicacion-iesgn.rhcloud.com 5383412ce0b8cd98650000ae]\>  netstat -utan | grep $OPENSHIFT_PHP_IP
        tcp        0      0 127.5.215.1:8080            0.0.0.0:*                   LISTEN      
        [aplicacion-iesgn.rhcloud.com 5383412ce0b8cd98650000ae]\>  netstat -utan | grep $OPENSHIFT_MYSQL_DB_HOST
        tcp        0      0 127.5.215.2:3306            0.0.0.0:*                   LISTEN      


### Análisis de los registros (logs)

Podemos acceder a los logs de los servicios que tenemos instalado en nuestro gear en el directorio app-root/logs:

        [aplicacion-iesgn.rhcloud.com logs]\> ls
        mysql.log  php.log


