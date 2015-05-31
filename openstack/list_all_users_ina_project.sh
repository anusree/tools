#/bin/sh
if [ $# -eq 0 ]
then 
echo "Please enter a project name"
exit 1
fi


PROJECT_NAME=$1
PROJECT_INFO=$(openstack project show $PROJRCT_NAME)

if [ $? -eq 0 ]
then
	openstack user list --project $PROJECT_NAME
else
	echo "Project $PROJECT_NAME does not exist"
fi
