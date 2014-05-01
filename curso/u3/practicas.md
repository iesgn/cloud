---
layout: blog
tittle: Entornos de pruebas para OpenStack
menu:
  - Unidad 3
---
## Prácticas

###Los siguientes pasos... (Después de la instalación de OpenStack)

* Crear sabores que se adapten mejor a nuestras necesidades:
	* Si queremos instanciar máquinas cirros no es necesario 512 Mb de RAM. Podemos crear un sabor **m1.enano** con 256 Mb de RAM.
	* Si necesitamos instanciar máquinas ubuntu necesitamos un sabor con 512 Mb pero que tenga de "Disco raiz" 0 Mb. Podemos crear un sabor **m1.tiny2** con 512 Mb de RAM y 0 Mb de "Disco raíz".

* Bajarnos una imagen de Ubuntu 12.04 y subirla al cloud (apartado Imágenes):

[http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-armhf-disk1.img](http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-armhf-disk1.img)

* Las reglas de seguridad que vienen definidas parecen que no funcionan. Crear al menos las dos siguientes:
	* Para hacer ping, una regla del tipo "ALL ICMP"
	* Para acceder por ssh, una regla del tipo SSH
* Las instancias deben tener conexión a internet, pero el servidor DNS habrá que modificarlo para resolver nombres


###Ejercicio

1. Modifica las reglas de seguridad como se ha explicado anteriormente
2. Crea una instancia a partir de la imagen cirros
3. Asígnale una ip flotante
4. Comprueba que se le puede hacer ping
5. Comprueba que se puede acceder por ssh. Usuario: **cirros**, password: **cubswin:)**
6. Una vez has accedido a la instancia comprueba que tiene internet (ping 8.8.8.8)



