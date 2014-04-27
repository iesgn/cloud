---
layout: blog
tittle: Entornos de pruebas para OpenStack
menu:
  - Unidad 3
---
###Objetivos

* Estudiar las distintas formas para implantar OpenStack en un entorno de pruebas.
* Implantar la infraestructura de openstack que vamos a usar durante el curso.
* Conocer los pasos que se van a producir durante la instalación de OpenStack.
* Debatir los posibles cambios que se pueden realizar a nuestra configuración para aumentar la funcionalidad.

###Contenidos

Vamos a presentar diferentes formas de instalar OpenStack en un entorno de pruebas en nuestro ordenador. Tendremos que discutir las ventajas e incovenientes de cada opción y decidir cúal puede ser la más válida para el curso. Las distintas opciones que tenemos disponibles son las siguientes:

* [Devstack](devstack)
* [RDO](rdo)
* [OpenStack-ansible](openstack-ansible)


###Resumen

Tenemos varias formas de hacer una instalación de OpenStack en un ordenador, veamos en resumen algunas de ellas:

|     |DevStack|RDO|OpenStack-ansible|
|:---:|--------|---|-----------------|
|**Instalación**|En máquina física o en máquina virtual|En máquina física|En 4 máquinas virtuales|
|**Versión OpenStack**|Havana o Ice House|Havana|Havana|
|**Servicios Openstack**|Se pueden configurar de una manera fácil los servicios que queremos ofrecer|Todos|Todos|
|**Vagrant - Ansible**|Para la instalación en una máquina virtual existen repositorios donde encontramos las recetas|No|Si|
|**Ventajas**|La instalación y configuración es muy sencilla. Se puede instalar distintas versiones.|Fácil de instalar y creo que muy depurado. Buen rendimiento. Puede ser perfecto para un entorno de pruebas|Entorno de pruebas muy cercano al real, con nodo de red, nodo de almacenamiento, etc. Es muy adecuado para luego pasarlo a entorno real|
|**Incovenientes**|No es totalmente real porque el controlador tiene todos los componentes. La instalación sobre una máquina virtual ofrece menos rendimiento, lo ideal es instalarlo sobre una máquina física|No es totalmente real porque el controlador tiene todos los componentes (incluso compute). No sé lo difícil que puede ser modificarlo para un entorno real|Al utilizarse sobre MVs tiene peor rendimiento y es más exigente en cuanto a requisitos de Hardware|

