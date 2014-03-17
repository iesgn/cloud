---
layout: blog
tittle: Introducción al Cloud Computing, OpenStack, vagrant y ansible. 
menu:
  - Unidad 1
  - Unidades
---
## Prácticas con Ansible

###Práctica 1: Instalación de un servidor web apache en una máquina virtual

Puedes encontrar los ficheros que vamos a usar en esta páctica en el siguiente [repositorio](https://github.com/iesgn/cloud/tree/gh-pages/curso/u1/practicas/ansible/practica1).

1) Instalar ansible

        root@maquina:~$ apt-get install python-pip
        root@maquina:~$ pip install ansible
 
2) Creamos con vagrant la máquina virtual

        usuario@maquina:~/practica1$ vagrant up
        
3) Veamos algunos ficheros importantes en nuestro escenario:

* ansible.cfg: Configuramos los parámetros (clave ssh y usuario) para acceder a las máquinas.
* ansible_hosts: Definimos las máuinas de nuestro escenario.
* escenario.yaml: receta principal, donde se indican las distintas recetas que encontramos en el directorio playbooks.

4) Ejecutamos la receta principal:

        usuario@maquina:~/practica1$ ansible-playbook escenario.yaml
        
Las tareas que se realizan son las siguientes:

* Se actualiza el repositorio de paquetes en nuestra máuina virtual (playbooks/common.yaml).
* Se instala apache2 en la máuina virtual (playbooks/webservers.yaml)
* Se copia un fichero index.html en el DocumentRoot del servidor web (playbooks/webservers.yaml)
   	
5) Podemos porbar que el servidor web funciona accedeiendo a la URL:

        http://10.1.1.101
     
        
###Práctica 2: Balanceador DNS

Puedes encontrar los ficheros que vamos a usar en esta páctica en el siguiente [repositorio](https://github.com/iesgn/cloud/tree/gh-pages/curso/u1/practicas/ansible/practica2).


