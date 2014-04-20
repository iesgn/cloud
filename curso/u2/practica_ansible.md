---
layout: blog
tittle: Herraminetas DevOps. Git, Vagrant y Ansible
menu:
  - Unidad 2
---
## Prácticas con Ansible

###Práctica 1: Instalación de un servidor web apache en una máquina virtual

Puedes encontrar los ficheros que vamos a usar en esta práctica en el siguiente
[directorio](https://github.com/iesgn/cloud/tree/gh-pages/curso/u2/practicas/ansible/practica1)
del respositorio del curso.

1. Instalar ansible

	root@maquina:~$ apt-get install python-pip python-dev
	root@maquina:~$ pip install ansible
 
2. Creamos con vagrant la máquina virtual

	usuario@maquina:~/practica1$ vagrant up
        
3. Veamos algunos ficheros importantes en nuestro escenario:

	* ansible.cfg: Configuramos los parámetros (clave ssh y usuario) para acceder a las máquinas.
	* ansible_hosts: Definimos las máuinas de nuestro escenario.
	* escenario.yaml: receta principal, donde se indican las distintas recetas que encontramos en el directorio playbooks.

4. Ejecutamos la receta principal:

        usuario@maquina:~/practica1$ chmod 600 vagrant_private_key
        usuario@maquina:~/practica1$ ansible-playbook escenario.yaml
        
	Las tareas que se realizan son las siguientes:

	* Se actualiza el repositorio de paquetes en nuestra máuina virtual (playbooks/common.yaml).
	* Se instala apache2 en la máuina virtual (playbooks/webservers.yaml)
	* Se copia un fichero index.html en el DocumentRoot del servidor web (playbooks/webservers.yaml)
   	
5. Podemos porbar que el servidor web funciona accedeiendo a la URL:

        http://10.1.1.101
     
        
###Práctica 2: Balanceador DNS

Puedes encontrar los ficheros que vamos a usar en esta páctica en el siguiente [repositorio](https://github.com/iesgn/cloud/tree/gh-pages/curso/u2/practicas/ansible/practica2).

Utilizando entradas tipo A duplicadas en un servidor DNS es posible realizar de forma muy sencilla un balanceo de carga entre varios equipos, esto se conoce como [DNS round robin](http://en.wikipedia.org/wiki/Round-robin_DNS).

1. Levantar el escenario:

        usuario@maquina:~/practica2$ vagrant up

	En este caso vamos a realizar un balanceo de carga entre dos servidores web, para lo que creamos un escenario con tres equipos:

	* nodo1: 10.1.1.101 <- Servidor web
	* nodo2: 10.1.1.102 <- Servidor web
	* dns: 10.1.1.103 <- Servidor DNS

2. Configuración del escenario:

        usuario@maquina:~/practica2$ chmod 600 vagrant_private_key
        usuario@maquina:~/practica2$ ansible-playbook escenario.yaml
        
3. Prueba de funcionamiento

	Si no ha habido errores durante la ejecución de los playbooks, se puede comprobar que se realiza el balanceo www.example.com entre nodo1 y nodo2, repitiendo la consulta DNS con dig:

        dig @10.1.1.103 www.example.com

	También puede verse de forma mucho más clara a través del navegador, para lo cual es necesario añadir la dirección IP como servidor DNS primario la dirección 10.1.1.103 y podremos comprobar como se balancean las peticiones entre los dos servidores web nodo1 y nodo2 (es necesario forzar la recarga, CTRL+F5 por ejemplo).
