---
layout: blog
tittle: OpenStack. Redes.
menu:
  - Unidad 8
---
En las unidades anteriores se han visto dos elementos fundamentales para
configurar la infraestructura como servicio, esto es máquinas virtuales y
almacenamiento, pero falta un último elemento: la <a
href="http://en.wikipedia.org/wiki/Network_virtualization">virtualización de
redes</a>. La virtualización de redes consiste en desacoplar las redes virtuales
del hardware de red para lograr una mejor integración de los entornos virtuales.

El componente de OpenStack que se encarga de gestionar la virtualización de
redes es neutron y es un componente que se incluyó en OpenStack Folsom con el
nombre de quantum. OpenStack neutron está sometido a un importante desarrollo y
va incluyendo paulatinamente diferentes tecnologías de red como "backends"
mediante <a
href="https://wiki.openstack.org/wiki/Neutron#Using_Neutron">plugins</a>

En nuestro caso, vamos a utilizar Open vSwitch como la tecnología por debajo de
neutron encargada de la virtualización de la red.

**Nota:** Aunque en OpenStack Havana está recomendado utilizar Open vSwitch
mediante el nuevo plugin *Modular Layer 2* (ML2), hemos utilizado directamente
el plugin de Open vSwitch.

## Open vSwitch

<a href="http://openvswitch.org/">Open vSwitch (OVS)</a> es una implementación
de software libre de un switch virtual distribuido multicapa.

Las máquinas GNU/Linux incluyen ya un software para la utilización de switches
L2, software conocido como "linux bridge", incluido en el kérnel linux y
manejado con las herramientas del espacio de usuario "bridge-utils" y en
particular con la instrucción *brctl*. OpenvSwitch es un desarrollo nuevo e
independiente que se incluyó en la versión 3.3 del kérnel linux y que
proporciona mayor funcionalidad para entornos de virtualización de redes, como
muy bien se explica en <a
href="http://git.openvswitch.org/cgi-bin/gitweb.cgi?p=openvswitch;a=blob_plain;f=WHY-OVS;hb=HEAD">Why
OpenvSwitch?</a>.

## Características necesarias

En un entorno con varios nodos de computación como tenemos en OpenStack,
precisamos de algunas características de la red como las siguientes:

- Máquinas que se ejecutan en el mismo nodo de computación, pero que estén en
  diferente red local.
- Máquinas que se ejecutan en diferentes nodos de computación, pero que
  virtualmente estén en la misma red local.
- Cuando sea preciso, un servidor DHCP por cada subred que no interfiera con los
  de otras subredes
- Reglas de cortafuegos definidas por máquina, no por red.
- Tráfico seguro entre nodos de computación
- Conexión de las máquinas virtuales con el exterior.

## Tipo de despliegue

Dependiendo del uso que vaya a tener nuestro cloud, optaremos por alguno de los
tipos de despliegue que soporta neutron, en particular debemos saber si:

* Todas las instancias de todos los proyectos estarán dentro de una misma
VLAN, lo que OpenStack denomina <a
href="http://docs.openstack.org/grizzly/openstack-network/admin/content/app_demo_flat.html">Single
Flat Network</a>.
* Cada proyecto podrá definir las redes privadas que quiera, pero compartirán el
o los routers de acceso al exterior, lo que OpenStack denomina <a
href="http://docs.openstack.org/grizzly/openstack-network/admin/content/app_demo_single_router.html">
Provider Router with Private Networks</a>
* Cada proyecto podrá definir las redes privadas y routers que quiera, de forma
independiente al resto de proyectos, lo que OpenStack denomina <a
href="http://docs.openstack.org/grizzly/openstack-network/admin/content/app_demo_routers_with_private_networks.html">
Per-tenant Routers with Private Networks</a>

En este caso utilizaremos <a
href='http://docs.openstack.org/havana/install-guide/install/apt/content/section_networking-routers-with-private-networks.html'>Per
tenant routers with private networks</a>, que permite que cada proyecto defina
sus propios routers y por tanto cada proyecto utilice su propio direccionamiento
IP de forma totalmente independiente al resto de proyectos.

<div style="text-align: center;"><img
src="http://docs.openstack.org/grizzly/openstack-network/admin/content/figures/1/figures/UseCase-MultiRouter.png"
alt="neutron setup"/></div>

### Referencias

* <a
  href="http://www.sdncentral.com/what-the-definition-of-software-defined-networking-sdn/">What’s
  Software-Defined Networking (SDN)?</a>
* <a
  href="http://www.networkworld.com/news/tech/2014/021114-sdn-network-functions-virtualization-278662.html">
  Understanding the differences between Software Defined Networking, network
  virtualization and Network Functions Virtualization</a>

