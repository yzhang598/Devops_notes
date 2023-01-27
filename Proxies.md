# Proxies and Load Balancer



## Proxies

- Middle server between client and target server.

- Take requests forward to actully server. 

### Forward Proxies

- Hide clients, users
- block things some sites (school network
- VPN

### Reverse Proxies

- Instead of Hide users, hide the destation servers

- CDN (also cache some data like html)

- Load Balancer

    

## Load Balancer

A type of reverse proxies. Distrubute the traffic and balance the load. Repica LB or backup.

#### Alogthim

- round robin (goes in cycle)
- Weighted round robin (because some server maybe not powerful as other)
- based on least connections
- based on user locations
- Hashing

#### Tpyes

- Layer 4 (TCP, transport): Just look IPs, Faster, cannot be smart no app data, less fixable
- Layer 7 (Application): some app data, Slower, much more powerful, expensive

#### Reading

- Paper: Maglev

- Open source: Nginx