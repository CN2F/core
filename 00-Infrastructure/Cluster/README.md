# Deploying the Cluster
To deploy the Kubernetes cluster, we use Rancher Kubernetes Engine (RKE). For that we need to do the following steps:

### 1. Download RKE
First, download the latest stable (not rc) version of rke execugable from [Github](https://github.com/rancher/rke/releases/). Then, we need to change file permissions and add executalbe permission to it:
```
$ chmod +x /path/to/RKE
```

### 2. Prepare Nodes
Secondly, we need to prepare cluster nodes for RKE. RKE needs to ssh into nodes and do the magic behind the scenes. For that, in master node we generate an ssh key:
```
$ ssh-keygen
```
Just press enter until you have the ssh key in `$HOME/ssh` folder. Note that you need to know the name of that file, by default if you are generating this key for the first time its name is `id_rsa`.

Now, we need to copy the (public) generated key to **all** nodes. Run the following command, replace `host-ip` with ip address of the node and `user` with username of that node.
```
$ ssh-copy-id -i ~/.ssh/id_rsa.pub user@host-ip
```
### 3. Preapae Config File
Thirdly, we need to prepare a config file for RKE to setup the cluster. This file contains some information about cluster nodes (such as their ip address and their role in the cluster) and about the cluster itself (such as required CNI and IP range). [Rancher Documentation](https://rke.docs.rancher.com/) is the best source to find out about different parametes that can be set for RKE. Here's the cluster config file of the CN2F:

```
cluster_name: cn2f
nodes:
  - address: 10.0.0.10
    nodeName: master
    user: ion
    role: [controlplane, etcd]
  - address: 10.0.0.20
    nodeName: core
    user: ion
    role: [worker]
    labels:
      environment: core
  - address: 10.0.0.30
    nodeName: rcc
    user: ion
    role: [worker]
    labels:
      environment: rcc
  - address: 10.0.0.40
    nodeName: rru
    user: ion
    role: [worker]
    labels:
      environment: rru
 services:
   kube-controller:
     cluster_cidr: 10.233.0.0/18
     service_cluster_ip_range: 10.233.64.0/18
network:
  plugin: calico
```

### 4. Installing kubectl
We need kubectl to controll our cluster. There are several ways to install this tool, the easiest of which is to use snap:
```
$ sudo snap install --classic kubectl
```

### 5. Deploy the Cluster
Now, put the config file with the name of `cluster.yml` alongside the `RKE` executable file, then enter the following commands:
```
$ ./RKE_file_name up
```

If everything is setup currectly and RKE could ssh into worker nodes, It will start pulling the requied images and installs different components. After this proccess completes, you have to copy the config file into a specific directory. This way, `kubectl` could recognize your cluster and interact with API Server in a proper way.

```
$ cp ./kube_config_cluster.yml $HOME/.kube/config
```

### 6. Check Cluster Health

After some while, cluster will be ready and you can use the `kubectl` command to check it. 
```
$ kubectl get nodes
```
The outout of above command will be name of nodes with their states, which should be `ready`.
