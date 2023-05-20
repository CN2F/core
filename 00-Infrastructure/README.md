# Infrastructure

Here we discuss the underlying infrastrucrue of CN2F, and how to deploy the reuired modules to get ready and run testbeds.

There are 5 steps towards deploying requied infrastructure:

## 0. Checking The Requirements
First of all, check the [requirements](./Requirements/).
## 1. Installing OS
You have to install `ubuntu 18.04 LTS` on all systems.

## 2. Installing Software Packages
After installing OS on systems, you have to install some software packages such as `docker`, `i7z`, and `git`. This proccess is automated with the help of [ansible](./Ansible/).

## 3. Placing Bridges
To setting up transparent bridges, follow these [instructions](./Bridge/). It should be placed between `Core` and `RAN` systems. After checking the network connectivity, go to the final step.
## 4. Deploying the Cluster
You have to deploy a Kubernetes cluster with `1` master node and `3` worker nodes. There are several tools to do so, we use [RKE](./Cluster/) for cluster setup.

