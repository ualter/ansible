##Cheat Sheet

### Tools (Install)
```
# macOS install Ansible
$ pip3 install ansible

# Install Boto3 (AWS Python SDK)
pip3 install boto boto3

# Install Molecule (For Ansible Tests)
pip3 install molecule
```

## Commands
### Ansible
```bash
$ ansible-playbook -i hosts test-ansible.yml
$ ansible -i hosts --connection=local local -m ping
$ ansible-playbook nginx.yaml -i hosts --extra-vars "ansible_sudo_pass=1234" 

# Create a role from Galaxy
$ ansible-galaxy init nginx
# Run a role (server.yml)
$ ansible-playbook -i ../hosts server.yml --extra-vars "ansible_sudo_pass=1234 ansible_become=true"
$ ansible-vault create vars/main.yml
$ ansible-galaxy init users

# Run a role (server.yml)
$ ansible-playbook -i ../hosts server.yml --extra-vars "ansible_sudo_pass=1234 ansible_become=true"
$ ansible-vault create vars/main.yml
$ ansible-galaxy init users

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
ssh-keygen -t rsa -C "OS X laptop ssh key"
ssh-copy-id -i ~/.ssh/id_rsa.pub box1
ssh-copy-id -i ~/.ssh/id_rsa.pub Equipo@192.168.2.15
scp /home/osboxes/.ssh/id_rsa.pub Equipo@192.168.1.43:/Users/Equipo/.ssh
```

### AWS SDK CLI
```bash
aws s3 ls
aws s3 rb s3://ualter-817275b --force #delete bucket
```

### Troubleshooting
```
# Error
--> Failed to import the required Python library (botocore or boto3) on
# Solution
$ pip install --user boto3 botocore
```


### Install sshpass (to work ssh with user and pass)
```bash
brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
```
