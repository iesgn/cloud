---
layout: blog
tittle: Infraestructura para utilizar OpenStack
menu:
  - Unidad 5
---

###Objetivos

* Conocer el origen del proyecto que ha permitido el despliegue de la
* infraestructura de cloud computing en el IES Gonzalo Nazareno.
* Conocer las principales características de la infraestructura de Cloud
* Computing montada en el IES Gonzalo Nazareno.
* Visitar las instalaciones donde tenemos alojados los servidores.
* Conocer las especificaciones técnicas del hardware de los servidores.

### Contenidos

####OpenStack en el IES Gonzalo Nazareno

En el año 2011 el IES Gonzalo Nazareno, junto a otros tres institutos
desarrollan el proyecto de innovación aplicada y transferencia del conocimiento
en la formación profesional del sistema educativo, con el título: **Implantación
y puesta a punto de la infraestructura de un cloud computing privado para el
despliegue de servicios en la nube**. 
El objetivo general de este proyecto es la inclusión de las tecnologías de cloud
computing (IaaS) en el currículo de los ciclos formativos de la Familia
Profesional de Informática y Comunicaciones. 

Sitio web con todos los resultados del proyecto:
[Cloud Computing con OpenStack en
educación](http://www.gonzalonazareno.org/cloud/)

El proyecto nos permitió obtener los recursos para la adquisición de los equipos
necesarios para el montaje de la infraestructura de cloud computing.
Podemos ver las características de los distintos equipos en el siguiente documento:

* [Infraestructura para el
  cloud](http://www.gonzalonazareno.org/cloud/material/infraestructura.pdf)

El software que elegido para la gestión del cloud fue OpenStack. La primera
versión del software que se instaló fue OpenStack Essex (2012.1) sobre Debian
Wheezy utilizando los paquetes oficiales. Posteriormente realizamos una
actualización a OpenStack Grizzly (2013.1) utilizando los paquetes no oficiales
de [GPLHost](http://www.gplhost.com/software-openstack.html).

####Infraestructura para OpenStack

[Componentes de OpenStack](componentes_openstack.html)

[Hardware](hardware_openstack.html)

[Ejemplos de arquitectura](arquitectura_openstack.html)