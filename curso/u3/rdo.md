---
layout: blog
tittle: Entornos de pruebas para OpenStack
menu:
  - Unidad 3
---

## RDO

RDO es una distribución mantenida por la comunidad de usuarios que permite
ejecutar OpenStack en sistemas Red Hat y derivados (fedora y CentOS).

RDO utiliza la herramienta packstack, que mediante el uso de manifiestos de
puppet y un simple fichero de configuración es capaz de instalar OpenStack en
uno o varios nodos.

### Requisitos

* Software: RHEL 6.4 o equivalente (CentOS p. ej.)
* Hardware: Equipo con extensiones de virtualización por hardware en el procesador y al menos 2 GiB de RAM libre.

### Instalación

Utilizando RDO podemos tener OpenStack Havana (aunque ya está disponible Icehouse hemos considerado más adecuado utilizar Havana para este curso) funcionando en unos minutos siguiendo estos [3 sencillos pasos](http://openstack.redhat.com/Quickstart):

      # yum install -y http://rdo.fedorapeople.org/openstack-havana/rdo-release-havana.rpm
      # yum install -y openstack-packstack
      # packstack --allinone

### Utilización

Podemos acceder a Horizon con la URL http://&lt;IP_del_equipo&gt;/dashboard y acceder
con el usuario admin (para tareas de administración) o el usuario demo para
utilización normal de OpenStack. Las contraseñas de ambos usuarios se encuentran
definidas en los ficheros keystonerc_admin o keystonerc_demo ubicados en el
directorio desde el que se ejecutó la instrucción packstack.

La principal limitación que tiene la configuración automática de RDO con
packstack es que no se puede acceder a las instancias desde un equipo exterior,
ya que el bridge-exterior no está conectado a ninguna interfaz física.

### Conectar el br-ex al exterior

Para conectar el bridge exterior al exterior seguimos los siguientes pasos:
<ul>
<li>Editamos el fichero /etc/sysconfig/network-scripts/ifcfg-br-ex y ponemos el siguiente contenido:
<pre><code>
	DEVICE=br-ex
	DEVICETYPE=ovs
	TYPE=OVSBridge
	BOOTPROTO=static
	IPADDR=X.X.X.X   # La dirección inical de eth0
	NETMASK=X.X.X.X  # La máscara de red que corresponda
 	GATEWAY=X.X.X.X  # La dirección IP de la puerta de enlace
	DNS1=X.X.X.X     # El servidor DNS
	ONBOOT=yes
</code></pre></li>
<li>Editamos el fichero /etc/sysconf/network-scripts/ifcfg-eth0 y ponemos el siguiente contenido:
<pre><code>
	DEVICE=eth0
	HWADDR=XX:XX:XX:XX:XX:XX # La dirección MAC de eth0
	TYPE=OVSPort
	DEVICETYPE=ovs
	OVS_BRIDGE=br-ex
	ONBOOT=yes
</code></pre></li>

<li>Reiniciamos el servicio de red:
<pre><code>
	# service network restart
</code></pre></li>

<li>Comprobamos la conectividad de la máquina con el exterior a través de br-ex</li></ul>

### Enlaces interesantes

* [RDO](http://openstack.redhat.com/Main_Page)
