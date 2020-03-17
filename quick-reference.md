##Cheat Sheet

### Ansible / Tools (Install)
```
## 1. Install packages and dependencies
# Ubuntu (Must be here, and very well install, Python!   3 or 2, dependes on the Ansible version, here we go with Python3)
$ sudo apt-get -y install python3-pip
# Update pip (just in case)
$ pip3 install --upgrade pip
# Install Ansible
$ pip3 install ansible
# Install Boto3 (AWS Python SDK)
pip3 install boto boto3

## 2. Install/Config the SSH Server
# Install OpenSSH (if not) Ansible works connect to servers/locals via SSH 22, if not presented, Ansible will not work
$ sudo apt-get remove --purge openssh-server
$ sudo apt-get install openssh-server
$ sudo service ssh --full-restart
$ sudo apt-get install sshpass  # in case using the paramater --ask-pass in connections with Ansible
$ service --status-all # check ssh
$ ssh user@127.0.0.1 # must work (with your user)
# On Windows SubsSystem Linux (Ubuntu): 
#    - Check if the OpenSSH Service of Windows is not using the Port 22 (Firewall Rules Incoming also, check that)
#    - Install Docker Daemon to work with playbooks that use Docker as Engine (for tests, etc.)
#    - Install Docker Client on WSL and configures the env variable DOCKER_HOST to tcp://localhost:2375
#    - Configures Docker Daemon on Windows with tcp://localhost:2375 without TLS (restart it mandatory)
 
## 3. Config the users SSH access with Public Key
# Generate your SSH Key Pair
$ ssh-keygen -t rsa -C "ualter"
# Copy it to the Server (target)
$ ssh-copy-id ualter@127.0.0.1

## 4. Test connection
# Test ansible connection with the local (testing Ansible installation, OpenSSH server working, etc.)
# ...at the file host must be the inventory of Ansible pointing to localhost (for local tests)
$ ansible local -m ping -i hosts -v # With Public Key (prefered way - check at the hosts file the ansible_user=ualter that is going to be used in the connection)
# ... the user can be passed as an argument also
$ ansible local -m ping -i hosts -v --extra-vars "ansible_user=ualter"
# In case the Public Key not working, for testing with the password (will be requested)
$ ansible local -m ping -i hosts -v --ask-pass 

# When running playbooks that needs "sudo" (become: true)  
# Three alternatives
# 1) Add the user's used by ansible to the sudoers
$ sudo visudo
$ ualter ALL=(ALL:ALL) NOPASSWD:ALL
# 2) Add the info throughout a parameter at the command
$ --extra-vars "ansible_sudo_pass=password"
# 3) Add the parameter -K or --ask-pass to ask for the password

# Install Molecule (For Ansible Tests)
pip3 install molecule
```

## Commands
### Ansible
```bash
$ ansible-playbook -i hosts test-ansible.yml
$ ansible -i hosts --connection=local local -m ping
$ ansible-playbook nginx.yaml -i hosts --extra-vars "ansible_sudo_pass=1234" 

# Ansible Galaxy
# Create a role from Galaxy
$ ansible-galaxy init nginx
# Run a role (server.yml)
$ ansible-playbook -i ../hosts server.yml --extra-vars "ansible_sudo_pass=1234 ansible_become=true"  # Check Below ssh with public keys
$ ansible-vault create vars/main.yml
# Initialize a new role with a basic structure
$ ansible-galaxy init users
# Install a Role form the remote Ansible-Galaxy Repo
$ ansible-galaxy install geerlingguy.php
$ ansible-galaxy install geerlingguy.redis
$ ansible-galaxy install geerlingguy.docker
# Install Multiple Roles from a File (Requirements)
$ ansible-galaxy install -r requirements.yml
# Installing a Role from GitHub Source Code
$ ansible-galaxy install git+https://github.com/geerlingguy/ansible-role-apache.git
$ ansible-galaxy install git+https://github.com/chrismeyersfsu/provision_docker.git
# List Roles Locally Installed
$ ansible-galaxy role list
# Search Roles at the remote Ansible-Galaxy Repo
$ ansible-galaxy role search "SOMETHING"

# Run a role (server.yml)
$ ansible-playbook -i ../hosts server.yml --extra-vars "ansible_sudo_pass=1234 ansible_become=true"
$ ansible-vault create vars/main.yml
$ ansible-galaxy init users


# Gather Facts of the Hosts
$ ansible -i hosts local -m setup

# Vault
# Generate encrypted password for user module
$ ansible all -i localhost, -m debug -a "msg={{ 'mypassword' | password_hash('sha512', 'mysecretsalt') }}"
# Encrypt a file with sensitive info (use the env variable)
$ ansible-vault encrypt roles/users/variables/main.yml
# Encrypt a file asking for a password
$ ansible-vault create --vault-id passwdujr@prompt foo.yml
# Create a File with the Secret for Vault (used automatically)
$ export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault.txt
# Run Playbook (roles) with Vault security files on them
$ ansible-playbook --ask-vault-pass -i ./hosts server.yml
```

### Molecule
```bash
# Before (Preparation Virtual Env)
# Install Virtual Enviroment (if not yet)
$ python3 -m pip install virtualenv
# Create and activate a Virtual Environment
$ python3 -m virtualenv my_env
# Activate it
$ source my_env/bin/activate
# Install Molecule and Docker on it (Molecule automatically install Ansible along with other dependencies), others stuffs also:  
$ python3 -m pip install molecule docker
$ python3 -m pip install pytest
$ python3 -m pip install pytest-ansible
$ python3 -m pip install ansible-lint
$ python3 -m pip install testinfra

# Dependency Molecule on Ubuntu
$ sudo apt install -y python-docker

# Creating a new role for test
molecule init role ansible-apache -d docker

# Open it at Visual Studio Code
$ code ansible-apache/

# Run it
$ molecule test

# Exit the Virtual Environment (Python)
$ deactivate


## Troubleshooting
## ERROR
local/lib/python3.7/site-
packages/molecule/provisioner/ansible/plugins/filter/molecule_core.py) as it
seems to be invalid: No module named functools_lru_cache
fatal: [localhost]: FAILED! => {"msg": "An unhandled exception occurred while templating 
## SOLUTION
sudo apt install python-backports.functools-lru-cache


```

### SSH
```bash

# Install SSH Server Ubuntu
sudo apt-get install openssh-server
sudo service ssh status
sudo apt-get install sshpass   # enable the use of the parameter --ask-pass on the ansible execution

## Authorized the connection via Public key
# Generate a Key Pair at the Master Node
ssh-keygen -t rsa -C "OS X laptop ssh key"
# Copy the PubKey to the Target Server
ssh-copy-id osboxes@127.0.0.1
# or
ssh-copy-id -i ~/.ssh/id_rsa.pub Equipo@192.168.2.15
# This will adds/creastes the pubkey at the ~/.ssh/authorized_keys
# Using scp
scp /home/osboxes/.ssh/id_rsa.pub Equipo@192.168.1.43:/Users/Equipo/.ssh
# Using nothing
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# Test connection
ansible local -m ping -i hosts -v # With Public Key (the way that should be)
ansible local -m ping -i hosts -v --ask-pass # In case, for testing, asking the password
```

### AWS SDK CLI
```bash
aws s3 ls
aws s3 rb s3://ualter-817275b --force #delete bucket
```

### Troubleshooting
```
### Error
--> 
"Failed to import the required Python library (botocore or boto3) on..."

### Solution
$ pip install --user boto3 botocore
```
```
### Error
--> 
"Failed to import the required Python library (Docker SDK for Python: docker (Python >= 2.7) or docker-py (Python 2.6)) on osboxes's Python /usr/bin/python. Please read module documentation and install in the appropriate location. If the required library is installed, but Ansible is using the wrong Python interpreter, please consult the documentation on ansible_python_interpreter, for example via `pip install docker` or `pip install docker-py` (Python 2.6). The error was: No module named docker"

### Solution
$ sudo apt install -y python-docker
```


### Install sshpass (to work ssh with user and pass)
```bash
brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
```
