---
layout: blog
tittle: Introducción al Cloud Computing, OpenStack, vagrant y ansible. 
menu:
  - Unidad 1
  - Unidades
---
## Prácticas con Vagrant

###Práctica 1: Creación de una máquina virtual

1. Instalar virtualbox y vagrant

        root@maquina:~$ apt-get install visrtualbox
		root@maquina:~$ wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.5.1_x86_64.deb
		root@maquina:~$ dpkg -i vagrant_1.5.1_x86_64.deb

2. Nos descargamos el box de Ubuntu 12.04 de 64 bits, esto lo hacemos un usuario sin privilegios:

        usuario@maquina:~$ vagrant box add precise64 http://files.vagrantup.com/precise64.box
        
3. Puedo ver la lista de boxes que tengo instalada en mi usuario ejecutando la siguiente instrucción:

        usuario@maquina:~$ vagrant box list
        
4. Nos creamos un directorio y dentro vamos a crear el fichero Vagrantfile, podemos crear uno vacio con la instrucción:
        
        usuario@maquina:~/vagrant$ vagrant init
        
5. Modificamos el fichero Vagrantfile y los dejamos de la siguiente manera:

        # -*- mode: ruby -*-
        # vi: set ft=ruby :
        Vagrant.configure("2") do |config|
                       config.vm.box = "precise64"
                       config.vm.hostname = "mimaquina"
                       config.vm.network :public_network,:bridge=>"eth0"
        end    
        
6. Iniciamos la máquina:

        usuario@maquina:~/vagrant$ vagrant up
        
        
###Práctica 2: Creación de varias máuinas virtuales

###Práctica 3: Añadir un dico duro adicional a una máuina virtual


