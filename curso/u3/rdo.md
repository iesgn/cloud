---
layout: blog
tittle: Entornos de prueba para OpenStack.
menu:
  - Unidad 3
---

## RDO

RDO es una distribución mantenida por la comunidad de usuarios que permite
ejecutar OpenStack en sistemas Red Hat y derivados (fedora y CentOS).

RDO utiliza la herramienta packstack, que mediante el uso de manifiestos de
puppet y un simple fichero de configuración es capaz de instalar OpenStack en
uno o varios nodos.

### Requisitos

* Software: RHEL 6.4 o equivalente (CentOS p. ej.)
* Hardware: Equipo con extensiones de virtualización por hardware en el
* procesador y al menos 2 GiB de RAM libre.

### Instalación

Utilizando RDO podemos tener OpenStack funcionando en unos minutos siguiendo
estos [3 sencillos pasos](http://openstack.redhat.com/Quickstart):

      # yum install -y http://rdo.fedorapeople.org/rdo-release.rpm
      # yum install -y openstack-packstack
      # packstack --allinone

### Utilización

Podemos acceder a Horizon con la URL http://<IP_del_equipo>/dashboard y acceder
con el usuario admin (para tareas de administración) o el usuario demo para
utilización normal de OpenStack. Las contraseñas de ambos usuarios se encuentran
definidas en los ficheros keystonerc_admin o keystonerc_demo ubicados en el
directorio desde el que se ejecutó la instrucción packstack.

### Enlaces interesantes

[RDO](http://openstack.redhat.com/Main_Page)