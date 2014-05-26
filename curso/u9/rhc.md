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

    root@equipo:~# apt-get install ruby rubygems git
	root@equipo:~# gem install rhc
	
	Fetching: net-ssh-2.9.1.gem (100%)
	Fetching: net-scp-1.2.1.gem (100%)
	Fetching: net-ssh-gateway-1.2.0.gem (100%)
	Fetching: net-ssh-multi-1.2.0.gem (100%)
	Fetching: archive-tar-minitar-0.5.2.gem (100%)
	Fetching: highline-1.6.21.gem (100%)
	Fetching: commander-4.2.0.gem (100%)
	Fetching: httpclient-2.3.4.1.gem (100%)
	Fetching: open4-1.3.4.gem (100%)
	Fetching: rhc-1.24.4.gem (100%)
	===========================================================================
	
	If this is your first time installing the RHC tools, please run 'rhc setup'
	
	===========================================================================
	Successfully installed net-ssh-2.9.1
	Successfully installed net-scp-1.2.1
	Successfully installed net-ssh-gateway-1.2.0
	Successfully installed net-ssh-multi-1.2.0
	Successfully installed archive-tar-minitar-0.5.2
	Successfully installed highline-1.6.21
	Successfully installed commander-4.2.0
	Successfully installed httpclient-2.3.4.1
	Successfully installed open4-1.3.4
	Successfully installed rhc-1.24.4
	10 gems installed
	Installing ri documentation for net-ssh-2.9.1...
	Installing ri documentation for net-scp-1.2.1...
	Installing ri documentation for net-ssh-gateway-1.2.0...
	Installing ri documentation for net-ssh-multi-1.2.0...
	Installing ri documentation for archive-tar-minitar-0.5.2...
	Installing ri documentation for highline-1.6.21...
	Installing ri documentation for commander-4.2.0...
	Installing ri documentation for httpclient-2.3.4.1...
	Installing ri documentation for open4-1.3.4...
	Installing ri documentation for rhc-1.24.4...
	Installing RDoc documentation for net-ssh-2.9.1...
	Installing RDoc documentation for net-scp-1.2.1...
	Installing RDoc documentation for net-ssh-gateway-1.2.0...
	Installing RDoc documentation for net-ssh-multi-1.2.0...
	Installing RDoc documentation for archive-tar-minitar-0.5.2...
	Installing RDoc documentation for highline-1.6.21...
	Installing RDoc documentation for commander-4.2.0...
	Installing RDoc documentation for httpclient-2.3.4.1...
	Installing RDoc documentation for open4-1.3.4...
	Installing RDoc documentation for rhc-1.24.4...

Ya durante la instalación de rhc nos advierte que no hay una configuración
previa, por lo que es necesario hacer una configuración de rhc:

### Configuración inicial de OpenShift

Para realizar la configuración inicial de rhc, ejecutamos la instrucción:
	
    usuario@equipo:~$ rhc setup
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

<!-- Cada cuenta de usuario en OpenShift Online está asociada a un "espacio de -->
<!-- nombres" para generar un FQDN único para cada gear. En la configuración inicial -->
<!-- de la cuenta habrá que seleccionar un espacio de nombres que sea único, este -->
<!-- espacio de nombres se aplicará automáticamente a todos los gears que se creen. -->

<!-- Supongamos a partir de ahora que nuestro espacio de nombres en OpenShift -->
<!-- Online fuese "cepjerez" y el primer gear que creásemos tuviera el nombre -->
<!-- "joomla", entonces esta aplicación sería accesible a través de la -->
<!-- url http://joomla-cepjerez.rhcloud.com (no es un espacio de nombres real). -->

