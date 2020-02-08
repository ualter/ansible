##Cheat Sheet

```
# macOS
$ pip3 install ansible
```

### Commands
```bash
# Ansible
$ ansible-playbook -i hosts test-ansible.yml
$ ansible -i hosts --connection=local local -m ping


# SSH
ssh-keygen -t rsa -C "OS X laptop ssh key"
ssh-copy-id -i ~/.ssh/id_rsa.pub box1
ssh-copy-id -i ~/.ssh/id_rsa.pub 192.168.2.15
```

### Troubleshooting
```
# Error
--> Failed to import the required Python library (botocore or boto3) on
# Solution
$ pip install --user boto3 botocore
```


### Install sshpass (to work ssh with user and pass)
brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
