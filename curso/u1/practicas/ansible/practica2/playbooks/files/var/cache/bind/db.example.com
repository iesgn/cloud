$ORIGIN .
$TTL 86400      ; 1 day
example.com     IN SOA dns.example.com. postmaster.example.com. (
                                1          ; serial
                                21600      ; refresh (6 hours)
                                3600       ; retry (1 hour)
                                604800     ; expire (1 week)
                                21600      ; minimum (6 hours)
                                )
                        NS      dns.example.com.
$ORIGIN example.com.
nodo1		A	10.1.1.101
nodo2		A	10.1.1.102
dns		A	10.1.1.103
www		A	10.1.1.101
www		A	10.1.1.102