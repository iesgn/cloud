#!/bin/bash

# Creamos tres redes

NET_ID1=$(neutron net-create red1|grep ' id '|awk '{print $4}')
NET_ID2=$(neutron net-create red2|grep ' id '|awk '{print $4}')
NET_ID3=$(neutron net-create red3|grep ' id '|awk '{print $4}')

# Creamos tres routers

neutron router-create r1
neutron router-create r2
neutron router-create r3

# Cramos una subred para cada una de las redes

neutron subnet-create --name subred3 red3 75.10.3.0/24
neutron subnet-create --name subred2 red2 75.10.2.0/24
neutron subnet-create --name subred1 red1 75.10.1.0/24

# Conectamos r1 a la red pública y a la red1

neutron router-gateway-set r1 public
neutron router-interface-add r1 subred1

# Creamos dos puertos en la subred1 y en la subred2, que posteriormente conectaremos a r2

PORT_ID1=$( neutron port-create red1 --fixed-ip ip_address=75.10.1.254|grep ' id '|awk '{print $4}')
PORT_ID2=$( neutron port-create red2 --fixed-ip ip_address=75.10.2.254|grep ' id '|awk '{print $4}')
neutron router-interface-add r2 port=$PORT_ID1
neutron router-interface-add r2 port=$PORT_ID2

# Conectamos r3 a la red2 y a la red3

neutron router-interface-add r3 subred2
neutron router-interface-add r3 subred3

# Añadimos una ruta de encaminamiento en r2 para que poueda acceder a la red3
neutron router-update r2 --routes type=dict list=true destination=75.10.3.0/24,nexthop=75.10.2.1
# Añadimos una ruta de encaminamiento en r3 para que poueda acceder a la red1
neutron router-update r3 --routes type=dict list=true destination=75.10.1.0/24,nexthop=75.10.2.254
# Añadimos rutas al servidor DHCP de la red1 para que envíe a las intancias un camino para llegar a la red2 y a la red3.
neutron subnet-update subred1 --host_routes type=dict list=true destination=75.10.2.0/24,nexthop=75.10.1.254 destination=75.10.3.0/24,nexthop=75.10.1.254
# Añadimos una ruta al servidor DHCP de la red2 para que envíe a las intancias un camino para llegar a la red3.
neutron subnet-update subred2 --host_routes type=dict list=true destination=75.10.3.0/24,nexthop=75.10.2.1 destination=75.10.1.0/24,nexthop=75.10.2.254

# Creamos las reglas de seguridad (Permitimos IVMP y SSH)

neutron security-group-rule-create --direction ingress --protocol icmp --remote-ip-prefix 0.0.0.0/0 default
neutron security-group-rule-create --direction ingress --protocol tcp --port-range-min 22 --port-range-max 22 --remote-ip-prefix 0.0.0.0/0 default

# Creamos una clave ssh y le cambiamos los permisos

nova keypair-add mi_clave > mi_clave.pem
chmod 600 mi_clave.pem

# Creamos tres instancias ubuntu conectadas a cada una de las redes

nova boot --flavor m1.tiny2 --image ubuntu \
            --security-groups default\
	    --key-name mi_clave \
            --nic net-id=$NET_ID1 \
            pc1

nova boot --flavor m1.tiny2 --image ubuntu \
            --security-groups default\
	    --key-name mi_clave \
            --nic net-id=$NET_ID2 \
            pc2

nova boot --flavor m1.tiny2 --image ubuntu \
            --security-groups default\
	    --key-name mi_clave \
            --nic net-id=$NET_ID3 \
            pc3

# Asignamos una IP flotante a pc1

IP=$(nova floating-ip-create|awk 'NR==4'|awk '{print $2}')
nova floating-ip-associate pc1 $IP
