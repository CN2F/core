# Setting up Bridges
## Requirements
First, you should meet these requirements:
### Hardware
 - `1G` Switch
 - `CAT6` Cabel
### Software
 - `mininet`
 - `onosproject/onos` docker image
 - [mininet topology](./code/topo.py)

## Setting up Transparent Bridge
### 1. Running the `onos` container
```
$ docker run -t -d -p 8181:8181 -p 8101:8101 -p 5005:5005 -p 830:830 --name onos onosproject/onos
```
Then you can access it via ` http://localhost:8181/onos/ui`

### 2. Activating Onos applications
 - OpenFlow 
 - Reactive Forwarding

### 3. Running the `mininet` topology

```
$ sudo mn --controller=remote,ip=172.17.0.2   --switch=ovs,protocols=OpenFlow13 --custom=bridge-topo.py --topo=onostopo
```

### 4. Configure ports
```
$ sudo ovs-vsctl add-port sl INTERFACE1 -- set interface INTERFACE1 ofport=1001

$ sudo ovs-vsctl add-port sr INTERFACE2 -- set interface INTERFACE2 ofport=1002
```

## Modify Link properties
You can modify link properties such as `delay` and `bandwidth` in case of testing scenarios:
```
$ sudo mn --controller=remote,ip=172.17.0.2   --switch=ovs,protocols=OpenFlow13 --custom=bridge-topo.py --topo=onostopo --link tc,bw=?,delay=?ms
```
