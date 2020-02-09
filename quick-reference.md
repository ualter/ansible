##Cheat Sheet

### Tools (Install)
```
# macOS install Ansible
$ pip3 install ansible

# Install Boto3 (AWS Python SDK)
pip3 install boto boto3
```

## Commands
### Ansible
```bash
$ ansible-playbook -i hosts test-ansible.yml
$ ansible -i hosts --connection=local local -m ping
$ ansible-playbook nginx.yaml -i hosts --extra-vars "ansible_sudo_pass=1234" 
$ ansible-galaxy init nginx
# Run a role (server.yml)
$ ansible-playbook -i ../hosts server.yml --extra-vars "ansible_sudo_pass=1234 ansible_become=true"
$ ansible-vault create vars/main.yml
$ ansible-galaxy init users
# Generate encrypted password for user module
$ ansible all -i localhost, -m debug -a "msg={{ 'mypassword' | password_hash('sha512', 'mysecretsalt') }}"
# Encrypt a file with sensitive info
$ ansible-vault encrypt roles/users/variables/main.yml
# Run Playbook (roles) with Vault security files on them
$ ansible-playbook --ask-vault-pass -i ./hosts server.yml
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
