---
layout: blog
tittle: Introducción a PaaS. OpenShift
menu:
  - Unidad 9
---

## Instalar OpenShift Client Tools

Como ya hemos visto en una sección previa, es posible crear un gear y añadir los
cartridges a través de la web de OpenShift, ahora vamos a explicar la forma de
hacerlo desde la línea de comandos  del equipo cliente utilizando rhc. Las
OpenShift Client Tools, conocidas como rhc, son unas aplicaciones escritas en
Ruby y disponibles como gemas, por lo que la instalación en cualquier sistema es
bastante sencilla: instalar ruby, rubygems y posteriormente instalar la gema
rhc. En el caso de un sistema Debian sería algo como:

    root@equipo:~# apt-get install ruby rubygems
	root@equipo:~# gem install rhc

En el caso de Debian Squeeze, los ejecutables de las gemas se instalan en el
directorio /var/lib/gems/1.8/bin/ por lo que no están en el PATH de ejecutables,
para incluirlas ejecutamos la instrucción:
	
root@equipo:~# ln -s /var/lib/gems/1.8/bin/rhc* /usr/local/bin/

Además rhc utiliza git, por lo que deberemos instalarlo si no lo tenemos ya en
el equipo cliente.
Configuración inicial de OpenShift

Para realizar la configuración inicial de rhc, ejecutamos la instrucción:
	
    usuario@equipo:~# rhc setup
	OpenShift Client Tools (RHC) Setup Wizard
 
    This wizard will help you upload your SSH keys, set your application namespace,
    and check that other programs like Git are properly installed.
 
    Login to openshift.redhat.com: [escribir correo-e]
    Password: ******
 
    Created local config file: /home/usuario/.openshift/express.conf
    The express.conf file contains user configuration, and can be transferred to
    different computers.
 
    We will now check to see if you have the necessary client tools installed.
 
    Checking for git ... found
 
    Checking for your namespace ... found namespace:
    espacio_de_nombres
 
    Checking for applications ... None
 
    Thank you for setting up your system.  You can rerun this at any time by calling
    'rhc setup'.
    Espacio de nombres (namespace)

Cada cuenta de usuario en OpenShift Online está asociada a un "espacio de
nombres2 para generar un FQDN único para cada gear. En la configuración inicial 
de la cuenta habrá que seleccionar un espacio de nombres que sea único, este
espacio de nombres se aplicará automáticamente a todos los gears que se
creen.

Supongamos a partir de ahora que nuestro espacio de nombres en OpenShift
Online fuese "cepjerez" y el primer gear que creásemos tuviera el nombre
"joomla", entonces esta aplicación sería accesible a través de la
url http://joomla-cepjerez.rhcloud.com (no es un espacio de nombres real).

