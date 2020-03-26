```bash

The AWS credentials (Access Key and Secret Key)...
must be at ~/.aws/credentials, otherwise...
At Enviroment variables

# Test with Python directly
chmod +x ec2.py
./ec2.py

# Using Ansible

# Ping EC2 Instances 
# all
ansible all -i ec2.py -u ec2-user --private-key ~/.ssh/eu-central-1-ec2-user.pem -m ping 
# region from Frankfurt
ansible eu-central-1 -i ec2.py -u ec2-user --private-key ~/.ssh/eu-central-1-ec2-user.pem -m ping
# Filtering by tags (Name=webserver)
ansible tag_Name_webserver -i ec2.py -u ec2-user --private-key ~/.ssh/eu-central-1-ec2-user.pem -m ping
ansible tag_Environment_dev -i ec2.py -u ec2-user --private-key ~/.ssh/eu-central-1-ec2-user.pem -m ping
ansible tag_Environment_prod -i ec2.py -u ec2-user --private-key ~/.ssh/eu-central-1-ec2-user.pem -m ping

# Running a specific command in all EC2 instances
# pwd 
ansible all -i ec2.py -u ec2-user --private-key ~/.ssh/eu-central-1-ec2-user.pem -m command -a "pwd"
# cat /etc/hosts
ansible all -i ec2.py -u ec2-user --private-key ~/.ssh/eu-central-1-ec2-user.pem -m command -a "cat /etc/hosts"
# apt-get update
ansible all -i ec2.py -u ec2-user --private-key ~/.ssh/eu-central-1-ec2-user.pem -m apt -a "upgrade=yes update_cache=yes" --become
# yum update
ansible all -i ec2.py -u ec2-user --private-key ~/.ssh/eu-central-1-ec2-user.pem -m yum -a "name=* state=latest" --become
# yum update filtering by tag Environment=dev
ansible tag_Environment_dev -i ec2.py -u ec2-user --private-key ~/.ssh/eu-central-1-ec2-user.pem -m yum -a "name=* state=latest" --become

# Using multiples tags
ansible "tag_Environment_dev,tag_Environment_prod" -i ec2.py -u ec2-user --private-key ~/.ssh/eu-central-1-ec2-user.pem -m command -a "cat /etc/hosts"
```