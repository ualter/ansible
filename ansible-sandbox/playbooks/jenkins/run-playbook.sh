
echo " "
echo "*** Install requirements (Roles)"
# ansible-galaxy install -r requirements.yml


if [ -z "$1" ]; then
   echo " "
   echo " Ops..."
   echo " Syntax: ./run-playbook.sh PORT [VERSION]"
   echo "          PORT    - Exposed Docker Port"        
   echo "          VERSION - Optional Jenkins Version, if not informed, the linux packaged version will be installed"
   echo " "
elif [ -z "$2" ]; then
   echo " "
   echo "*** Instaling Packaged Manager Version for Linux CentOS 7, port: $1"
   ansible-playbook -i hosts jenkins-playbook.yml --extra-vars "port=$1"
else    
   echo " "
   echo "*** Attempting Instaling Version $2 on Port $1"
   ansible-playbook -i hosts jenkins-playbook.yml --extra-vars "port=$1 version=$2"
fi
echo " "

