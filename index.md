---
layout: blog
tittle: Instalación y mantenimiento de redes
menu:
  - Enlaces
  - principal
  - Unidades
  
  
---
### Ejercicio: Instalación del servidor de correo postfix

####Instalación de Postfix

Vamos a instalar el servidor de correo postfix, con la siguiente instrucción:

        apt-get install postfix


El programa de configuración de paquetes de debian (debconf) hará dos preguntas durante la instalación a las que se debe responder de la si$

* Configuración del equipo como "Internet site", que significa que no utiliza ningún otro equipo para enviar el correo con SMTP
* Como nombre de correo ponemos iesgn.org

Estas características se incluyen en el fichero de configuración de postfix (/etc/postfix/main.cf),donde no hay que tocar los parámetros po$

Hay que asegurarse que el fichero /etc/mailname tiene el siguiente contenido: *iesgn.org*


Si modificamos algún parámetro de postfix habrá que hacer que el demonio que se está ejecutando vuelva a leer el fichero de configuración m$

        service postfix reload

####Pruebas de funcionamiento
Para comprobar que un servidor de correo está funcionando correctamente hay que hacer pruebas de envío y recepción de correo, tanto el enví$

        tail -f /var/log/mail.log


Vamos a utilizar un programa de correo en modo texto: el programa mail que se incluye en el paquete bsd-mailx. Un ejemplo de utilización se$

        # mail usuario
        Subject: Asunto
        Prueba de envío local
        [CTRL-D]
        Cc:
