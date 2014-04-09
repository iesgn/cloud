---
layout: blog
tittle: Implantación de la infraestructura de prueba OpenStack. 
menu:
  - Unidad 3
---
## DevStack

###Contenidos

DevStack es un conjunto de script bash que nos permiten instalar OpenStack de forma automática. Tenemos varias formas de realizar la instalación:

* En una máquina física
* En una máquina virtual, podemos usar el repositorio GitHub [https://github.com/xiaohanyu/vagrant-ansible-devstack]( https://github.com/xiaohanyu/vagrant-ansible-devstack).

La instlación se realiza en un único nodo, y se puede seleccionar la versión de OpenStack que vamos a instalr: Grizzly o Havana.
Además podemos decidir hacer una instlación básica (nova, cinder, glance, swift, keystone y horizon) o completa (se añaden los componentes neutron, heat y ceilometer).

* [Presentación: Implantación de la infraestructura de prueba OpenStack. DevStack](presentacion_devstack)
* [Instalando OpenStack en mi portátil (2ª parte): DevStack](http://www.josedomingo.org/pledin/2014/03/instalando-openstack-en-mi-portatil-2a-parte-devstack/)

###Enlaces interesantes

* [Devstack](http://devstack.org/)
* [Devstack en GitHub](https://github.com/openstack-dev/devstack)
* [https://github.com/xiaohanyu/vagrant-ansible-devstack]( https://github.com/xiaohanyu/vagrant-ansible-devstack)
