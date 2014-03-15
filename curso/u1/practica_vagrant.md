---
layout: blog
tittle: Introducción al Cloud Computing, OpenStack, vagrant y ansible. 
menu:
  - Unidad 1
  - Unidades
---
## Prácticas con Vagrant

###Práctica 1: Creación de una máquina virtual

1) Instalar virtualbox y vagrant

		root@maquina:~$ apt-get install visrtualbox
		root@maquina:~$ wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.5.1_x86_64.deb
		root@maquina:~$ dpkg -i vagrant_1.5.1_x86_64.deb

2) Nos descargamos el box de Ubuntu 12.04 de 64 bits, esto lo hacemos un usuario sin privilegios:

        usuario@maquina:~$ vagrant box add precise64 http://files.vagrantup.com/precise64.box
        
3) Puedo ver la lista de boxes que tengo instalada en mi usuario ejecutando la siguiente instrucción:

        usuario@maquina:~$ vagrant box list
        
4) Nos creamos un directorio y dentro vamos a crear el fichero Vagrantfile, podemos crear uno vacio con la instrucción:
        
        usuario@maquina:~/vagrant$ vagrant init
        
5) Modificamos el fichero Vagrantfile y los dejamos de la siguiente manera:

        # -*- mode: ruby -*-
        # vi: set ft=ruby :
        Vagrant.configure("2") do |config|
                       config.vm.box = "precise64"
                       config.vm.hostname = "mimaquina"
                       config.vm.network :public_network,:bridge=>"eth0"
        end    
        
6) Iniciamos la máquina:

        usuario@maquina:~/vagrant$ vagrant up
        
7) Para acceder a la instancia:
   	
        usuario@maquina:~/vagrant$ vagrant ssh default
    	      
8) Suspender, apagar o destruir:
    	
        usuario@maquina:~/vagrant$ vagrant suspend
        usuario@maquina:~/vagrant$ vagrant halt
        usuario@maquina:~/vagrant$ vagrant destroy
    	       
     
        
###Práctica 2: Creación de varias máquinas virtuales

1) En esta ocasión vamos a crear otro directorio y dentro un fichero Vagrantfile con el siguiente contenido:

        # -*- mode: ruby -*-
        # vi: set ft=ruby :
        
        Vagrant.configure("2") do |config|
        
          config.vm.define :nodo1 do |nodo1|
            nodo1.vm.box = "precise64"
            nodo1.vm.hostname = "nodo1"
            nodo1.vm.network :private_network, ip: "10.1.1.101"
          end
          config.vm.define :nodo2 do |nodo2|
            nodo2.vm.box = "precise64"
            nodo2.vm.hostname = "nodo2"
            nodo2.vm.network :public_network,:bridge=>"eth0"
            nodo2.vm.network :private_network, ip: "10.1.1.102"
          end
        end

Cuando iniciemos el escenario veremos que hemos creado dos máquinas virtuales: nodo1 y nodo2. 
nodo1 tendrá una red interna con ip 10.0.1.1.101, y nodo2 tendrá una interfaz de red "modo puente" y una interfaz de red del tipo red interna con ip 10.1.1.102.

Si accedemos por ssh a nodo1 podremos hacer ping a nodo2.


###Práctica 3: Añadir un dico duro adicional y modificar la RAM a una máquina virtual

Por últimos vamos a crear un nuevo Vagranfile en un nuevo directorio con este contenido:

        # -*- mode: ruby -*-
        # vi: set ft=ruby :
        
        Vagrant.configure("2") do |config|
        
          config.vm.define :nodo1 do |nodo1|
            nodo1.vm.box = "precise64"
            nodo1.vm.hostname = "nodo1"
            nodo1.vm.network :private_network, ip: "10.1.1.101"
            nodo1.vm.provider :virtualbox do |v|
				v.customize ["modifyvm", :id, "--memory", 768]
			end

          end
          
          disco = '.vagrant/midisco.vdi'
          config.vm.define :nodo2 do |nodo2|
            nodo2.vm.box = "precise64"
            nodo2.vm.hostname = "nodo2"
            nodo2.vm.network :public_network,:bridge=>"eth0"
            nodo2.vm.network :private_network, ip: "10.1.1.102"
            nodo2.vm.provider :virtualbox do |v|
				v.customize ["createhd", "--filename", disco, "--size", 1024]
				v.customize ["storageattach", :id, "--storagectl", "SATA Controller",
                             "--port", 1, "--device", 0, "--type", "hdd",
                             "--medium", disco]
				end
            end
        end

Como podemos ver al nodo1 le hemos modifcado el tamaño de lamemoria RAM y en el nodo2 hemos añadido undisco duro de 1Gb.

Para terminar, indicar que tenemos más parámetros de configuración que nos permiten configurar otros aspectos de la máquina virtual. Para más información accede a [http://docs.vagrantup.com/v2/](http://docs.vagrantup.com/v2/)

