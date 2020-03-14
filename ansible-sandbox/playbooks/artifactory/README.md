# Artifactory Ansible Playbook
#### Download the Dependencies (Roles)
```bash
ansible-galaxy install -r requirements.yml
```

#### Run the playbook
```bash
ansible-playbook -i ../hosts artifactory.yml
```