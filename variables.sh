#!/bin/bash

sudo touch /opt/output.txt
sudo chmod 777 output.txt

REGION="REGION=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)"
AZCODE="AZCODE=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .availabilityZone)"
PUBLICIP="PUBLICIP=$(curl --silent http://169.254.169.254/latest/meta-data/public-ipv4)"
PRIVATEIP="PRIVATEIP=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .privateIp)"
source /etc/ec2-tags
INSTANCENAME="INSTANCENAME=$Name"
INSTANCEID="INSTANCEID=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .instanceId)"
ACCOUNTID="ACCOUNTID=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .accountId)"

echo "$REGION" >> /opt/output.txt
echo "$AZCODE" >> /opt/output.txt
echo "$PUBLICIP" >> /opt/output.txt
echo "$PRIVATEIP" >> /opt/output.txt
echo "$INSTANCENAME" >> /opt/output.txt
echo "$INSTANCEID" >> /opt/output.txt
echo "$ACCOUNTID" >> /opt/output.txt

echo "export $REGION" >> ~/.bash_profile
echo "export $AZCODE" >> ~/.bash_profile
echo "export $PUBLICIP" >> ~/.bash_profile
echo "export $PRIVATEIP" >> ~/.bash_profile
echo "export $INSTANCENAME" >> ~/.bash_profile
echo "export $INSTANCEID" >> ~/.bash_profile
echo "export $ACCOUNTID" >> ~/.bash_profile

sudo chmod 755 output.txt
