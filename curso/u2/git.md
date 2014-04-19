---
layout: blog
tittle: Herraminetas DevOps. Git, Vagrant y Ansible
menu:
  - Unidad 2
---
## Introducción a Git

###Contenidos

[Git](http://git-scm.com/) es un software de control de versiones distribuido diseñado por Linus Torvalds, pensando en la eficiencia y la confiabilidad del mantenimiento de versiones de aplicaciones cuando estas tienen un gran número de archivos de código fuente. Git es uno de los sistemas de control de versiones más utilizado hoy en día por su rapidez y la gran cantidad de funcionalidades que ofrece. Es posible también que el éxito de Github esté propiciando la paulatina adopción de git en detrimento de otros sistemas como subversion.

[GitHub](https://github.com/) es una forja para alojar proyectos utilizando el sistema de control de versiones Git. Github permite alojar de forma gratuita un número indeterminado de **repositorios** públicos y es ampliamente utilizado hoy en día por grandes proyectos de software, así como por proyectos desarrollados por un solo individuo.

Muchos de los scripts que vamos a usar para implantar la infraestructura de prueba de OpenStack están alojados en repositorios en GitHub, por lo tanto tendremos que clonar dichos repositorios para bajarlos a nuestros equipos.

Cuando se desarrolla utilizando git, lo habitual es ir creando **ramas
(branchs)** independientes para cada funcionalidad. La rama por defecto se
denomina *master* y de ella suelen salir el resto de las ramas en un momento
determinado y se fusionan (*merge*) cuando se termina.

###Prácticas

1. Instala el cliente git

        # apt-get install git

2. Nuestro curso esta almacenado en un repositorio en GitHub, si quieres bajarlo sólo tienes que clonarlo:

        $ git clone https://github.com/iesgn/cloud.git
        
3. Si queremos actualizar nuestro repositorio local con los cambios del repositorio remoto

        $ cd cloud
        $ git pull

4. Cuando trabajemos con OpenShift necesitaremos hacer cambios en el repositorio remoto a partir de nuestro repositorio local, para ello tenemos que ejecutar tres instrucciones:

        $ git add <filename>
        $ git commit -m "Mensaje del commit"
        $ git push

###Enlaces interesantes

* [git - la guía sencilla](http://rogerdudler.github.io/git-guide/index.es.html)
* [Pro Git - Libro de referencia](http://git-scm.com/book)
