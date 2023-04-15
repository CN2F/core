# Preparing nodes

To automate and perform some tasks simultaneously during the initial setup of the laboratory systems, we utilized the Ansible tool by creating a playbook.

To utilize this playbook, a few steps need to be taken:
## In Managed Nodes
Managed systems would be our cluster nodes in the next section.
### 1. Create user
Create a user with the same username and password on all of these nodes.
### 2. Install Requirements
The only thing you must install is `openssh-server` because Ansible works by establishing an `SSH` connection to all of the managed nodes.

```
$ sudo apt install -y openssh-server
```

## In Control Node
Control node refers to the machine that is used to run Ansible playbooks and manage other machines or nodes.
### 1. Download the playbook
Download the attached playbook and navigate to its directory.
### 2. Install Requirements
You must install two requirements in this system:
 - `Ansible`
 - `openssh-client`

```
$ sudo apt install -y ansible 
$ sudo apt install -y openssh-client
```

### 3. Comment out not-needed parts
The playbook includes 10 distinct tasks, many of which are imported from a separate YAML file into the main playbook file. If you don't require certain tasks to be executed, you can easily comment out the import line associated with them.
### 4. Set username & remote-hosts
You need to set the `remote-hosts` file that includes the IP addresses, usernames, and passwords for all of the managed nodes. Here is an example:

```
[remote-hosts-group]
192.168.0.1 ansible_user=user1 ansible_password=pass1
192.168.0.2 ansible_user=user2 ansible_password=pass2
192.168.0.3 ansible_user=user3 ansible_password=pass3

```
Also set the username in this section in `main.yml`:
```
  vars:
    username: YOUR_USERNAME
```
### 5. Test SSH connection
To ensure that everything is working properly, test the SSH connections from the control node to the managed nodes.
### 6. Run!

Run the following command:

```
ansible-playbook -i remote-hosts main.yml --ask-become-pass --ask-pass
```

