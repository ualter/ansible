if [ -z "$1" ] && [ -z "$2" ]; then
   echo " "
   echo " Ops..."
   echo " Syntax: ./run-playbook.sh PORT_ARTIFACTORY PORT_MYSQL"
   echo " "
else    
   echo " "
   echo " **** Download Dependencies (Ansible Galaxy)"
   ansible-galaxy install -r requirements.yml
   echo " **** Running playbook..."
   ansible-playbook -i hosts artifactory.yml --extra-vars "port_artifact=$1 port_mysql=$2"
fi
echo " "






