---
layout: blog
tittle: Implantación de la infraestructura de prueba OpenStack
menu:
  - Unidad 2
  - Aplicaciones
---
## Introducción a Git

###Contenidos

[Git](http://git-scm.com/) es un software de control de versiones diseñado por Linus Torvalds, pensando en la eficiencia y la confiabilidad del mantenimiento de versiones de aplicaciones cuando estas tienen un gran número de archivos de código fuente. 

[GitHub](https://github.com/) es una forja para alojar proyectos utilizando el sistema de control de versiones Git.

Muchos de los scripts que vamos a usar para implantar la infraestructura de prueba de OpenStack están almacenado en **repositorios** en GitHub, por lo tanto tendremos que clonar dichos repositorios para bajarlos a nuestros equipos.

Por último, otro concepto importante son las **ramas (branchs)** de un proyecto git. Podemos entender una rama como una versión del proyecto Git, que por ejemplo ofrece otras funcionalidades. Por defecto la rama principal se llama *master*.

###Prácticas

1. Instala el cliente git

        # apt-get install git

2. Nuestro curso esta almacenado en un repositorio en GitHub, si quieres bajarlo sólo tienes que clonarlo:

        # git clone https://github.com/iesgn/cloud.git
        
3. Si queremos actualizar nuestro repositorio local con los cambios del repositorio remoto

        # cd cloud
        # git pull

###Enlaces interesantes

* [git - la guía sencilla](http://rogerdudler.github.io/git-guide/index.es.html)

