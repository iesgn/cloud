---
layout: blog
tittle: Entornos de pruebas para OpenStack
menu:
  - Unidad 3
---
## DevStack

###Contenidos

DevStack es un conjunto de script bash que nos permiten instalar OpenStack de forma automática. Tenemos varias formas de realizar la instalación:

* En una máquina física
* En una máquina virtual

La configuración de los servicios de OpenStack que se van a instalar se definen en un fichero de configuración de una forma muy sencilla. La instalación se realiza en un único nodo (aunque se puede realiza en multi-nodo), y se puede seleccionar la versión de OpenStack que vamos a instalar, en la actualidad, havana o ice house. Hay que tener en cuenta que la instalación sobre una máquina virtual ofrece menos rendimiento, lo ideal es instalarlo sobre una máquina física.

Para la instalación en una máquina virtual tenemos a nuestra disposición varios repositorio GitHub, que nos facilitan la tarea usando las herramientas de vagrant y ansible:  [vagrant-ansible-devstack]( https://github.com/xiaohanyu/vagrant-ansible-devstack) y [devstack-vm](https://github.com/lorin/devstack-vm).

Para el presente curso hemos desarrollado un [repositorio GitHub](https://github.com/iesgn/devstack-havana-cursocloud.git) donde tenemos disponibles los ficheros de instalación para instalar devstack en una máquina virtual (basado en el repositorio [devstack-vm](https://github.com/lorin/devstack-vm)) o en una física. 

* [Presentación: Implantación de la infraestructura de prueba OpenStack. DevStack](presentacion_devstack)

###Enlaces interesantes

* [Devstack](http://devstack.org/)
* [Devstack en GitHub](https://github.com/openstack-dev/devstack)
* [https://github.com/xiaohanyu/vagrant-ansible-devstack]( https://github.com/xiaohanyu/vagrant-ansible-devstack)
* [https://github.com/lorin/devstack-vm](https://github.com/lorin/devstack-vm)
* [Instalando OpenStack en mi portátil (2ª parte): DevStack](http://www.josedomingo.org/pledin/2014/03/instalando-openstack-en-mi-portatil-2a-parte-devstack/)

###Máquina virtual virtualbox con devstack

Si el proceso de instalación da algún problema, podemos probar OpenStack usando una máquina virtual de VirtualBox con devtack instalada. Es una máquina virtual con un interfaz de red tipo NAT, por lo tanto sólo se puede trabajar con openstack desde la misma máquina.

1. Bájate el [fichero ova](https://drive.google.com/file/d/0B7UU0o7-2U7pS1ZPV3AtUzlSN2s/edit?usp=sharing)
2. Importa la máquina a virtualbox. La máquina está configurada con 4GB de RAM; modifica este parámetro según tus necesidades.
3. Para acceder usa el usuario y contraseña: stack
4. Sigue las instrucciones de la presentación para reiniciar los servicios.
