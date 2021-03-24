#! /bin/bash
 
# Set default SSH port to 443 (to test health check port between LB and private instances)
sed -i 's/Port 22/Port 443/g' /etc/ssh/sshd_config
sed -i 's/#Port 443/Port 443/g' /etc/ssh/sshd_config
service sshd restart

sudo apt-get install awscli
sudo yum install python3
sudo yum install -y jq

INSTANCE_ID=`wget -qO- http://instance-data/latest/meta-data/instance-id`
REGION=`wget -qO- http://instance-data/latest/meta-data/placement/availability-zone | sed 's/.$//'`
aws ec2 describe-tags --region $REGION --filter "Name=resource-id,Values=$INSTANCE_ID" --output=text | sed -r 's/TAGS\t(.*)\t.*\t.*\t(.*)/\1="\2"/' > /etc/ec2-tags
