---
layout: blog
tittle: Implantación de la infraestructura de prueba OpenStack. OpenStack-ansible
menu:
  - Unidad 2
  - Aplicaciones
---

Vamos a instalar OpenStack a partir del repositorio GitHub [https://github.com/openstack-ansible/openstack-ansible](https://github.com/openstack-ansible/openstack-ansible).
La infraestructura estará compuesta por 4 máquinas virtuales creadas con vagrant y la configuración de cada una de ellas realizada por medio de ansible.
Es esquema de máquinas que se levantan son las siguientes y la los podemos representar usando el siguiente esquema:

* 10.1.0.2, nodo controlador.
* 10.1.0.3, nodo de computación.
* 10.1.0.4, nodo de red (neutron).
* 10.1.0.5, nodo de almacenamiento.

![esquema máquinas](img/InstalandoOpenStackEnMiPortatil.jpg "Esquema máquinas virtuales")

* [Presentación: Implantación de la infraestructura de prueba OpenStack. OpenStack-ansible](presentacion_os_ansible)
* [Instalando OpenStack en mi portatil](http://www.josedomingo.org/pledin/2014/02/instalando-openstack-en-mi-portatil/)

###Enlaces interesantes

* [https://github.com/openstack-ansible/openstack-ansible](https://github.com/openstack-ansible/openstack-ansible)
