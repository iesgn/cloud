---
layout: blog
tittle: Implantación de la infraestructura de prueba OpenStack
menu:
  - Unidad 3
---
###Objetivos

* Implantar la infraestructura de openstack que vamos a usar durante el curso.
* Conocer los pasos que se van a producir durante la instalación de OpenStack.
* Conocer la estructuras de máquinas virtuales que se van a crear con vagrant.
* Conocer las configuraciones básicas que se van a desplegar en los distintos nodos.
* Debatir los posibles cambios que se pueden realizar a nuestra configuración para aumentar la funcionalidad.

###Contenidos

Vamos a presentar diferentes formas de instalar OpenStack en un entorno de pruebas en nuestro ordenador. Tendremos que discutir las ventajas e incovenientes de cada opción y decidir cúal puede ser la más válida para el curso. Finalmente vamos a explicar la configuración de VPN para que se puedan realizar las prácticas en el OpenStack del IES Gonzalo Nazareno.

Tenemos varias formas de hacer una instalación de OpenStack en un ordenador, veamos en resumen algunas de ellas:

|     |DevStack|RDO|OpenStack-ansible|
|:---:|--------|---|-----------------|
|Instalación|En máquina física o en máquina virtual|En máquina física|En 4 máquinas virtuales|
|Versión OpenStack|Grizzly o Havana|Havana|Havana|
|Servicios Openstack|Configuración básica (nova, cinder, glance, keystone, swift, horizon); Configuración completa(se añaden los servicios de quantum, heat y ceilometer)|Todos|Todos|
|Vagrant - Ansible|Se puede utilizar el siguiente [repositorio GitHub](https://github.com/xiaohanyu/vagrant-ansible-devstack) o se puede instalar manualmente|No|Si|
|Ventajas|Utilizando el repositorio github, la instalación es muy sencilla. Se puede instalar grizzly o havana, y se puede hacer una configuración básica o una completa|Fácil de instalar y creo que muy depurado. Buen rendimiento. Puede ser perfecto para un entorno de pruebas|Entorno de pruebas muy cercano al real, con nodo de red, nodo de almacenamiento, etc. Es muy adecuado para luego pasarlo a entorno real|
|Incovenientes|No es totalmente real porque el controlador tiene todos los componentes. La instalación sobre una máquina virtual ofrece menos rendimiento, lo ideal instalarlo sobre una máquina física|No es totalmente real porque el controlador tiene todos los componentes (incluso compute). No sé lo difícil que puede ser modificarlo para un entorno real|Al utilizarse sobre MVs tiene peor rendimiento y es más exigente en cuanto a requisitos de Hardware|

* [Devstav](devstack)
* [RDO](rdo)
* [OpenStack-anssible](openstack-ansible)

