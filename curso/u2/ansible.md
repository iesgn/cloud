---
layout: blog
tittle: Herramientas DevOps. Git, Vagrant y Ansible
menu:
  - Unidad 2
---
## Introducción a Ansible

###Contenidos

De forma general, se le llama gestores de configuración a las aplicaciones software que nos permiten la configuración y el mantenimiento de un sistema informático. En el caso específico de sistemas operativos se trata de gestionar automáticamente todas las tareas de configuración de un sistema, automatizando la edición de ficheros de configuración, instalación de software y configuración del mismo, creación de usuarios y autenticación, de forma que se pueda hacer de forma automática y masiva. 

Dentro de esta categoría tenemos muchas aplicaciones que gestionan la configuración de un sistema operativo: [Chef](http://www.getchef.com/chef/), [Salt](http://www.saltstack.com/) y [Puppet](http://puppetlabs.com/), por ejemplo. Todos son libres, pero tienen [características específicas](http://en.wikipedia.org/wiki/Comparison_of_open_source_configuration_management_software) que hay que tener en cuenta a la hora de elegir uno u otro.

En nuestro caso nos hemos decantado por mostrar ansible [Ansible](http://www.ansible.com/home), que es un sistema de orquestación escrito en Python, que nos permite automatizar la configuración de una máquina. El principal motivo de esta elección es que es posiblemente el sistema más sencillo de aprender y fácil de instalar.

* [Presentación: Vagrant y ansible. Una combinación explosiva (2ª parte)](presentacion_ansible)

###Prácticas

* [Prácticas con Ansible](practica_ansible)

###Enlaces interesantes

* [Página oficial de Ansible](http://www.ansible.com/home)
* [Deploying with vagrant and ansible](https://speakerdeck.com/yeukhon/deploying-with-vagrant-and-ansible)


