echo "Install requirements (Roles)"
ansible-galaxy install -r requirements.yml

echo "Running Playbook"
ansible-playbook -i hosts jenkins-playbook.yml