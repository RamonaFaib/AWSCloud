#!/bin/bash
#1/16 Create a user called admin
sudo useradd admin
#2/16 Set password for user admin
echo "Set a password for admin: "
sudo passwd admin
#3/16 Check who can rwx /opt
ls -la /opt 
#4/16 Find out to which group sudoesr belong to
cd /etc
sudo cat /etc/sudoers
#5/16 Add user admin to sudoers list
sudo usermod -a -G wheel admin
echo " "
sudo grep 'wheel' /etc/group
#6/16 Login as admin
sudo -u admin bash << EOF
#7/16 Create a dir in /opt called archive
cd /opt
sudo mkdir archive
#8/16 Create a text file in /opt/archive called output
cd archive
sudo touch output.txt
sudo chmod 777 output.txt
echo "1/10 Create a directorty in /opt called archive" >> /opt/archive/output.txt
echo "Commands to use: " >> /opt/archive/output.txt
echo "sudo mkdir archive" >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
ls -la /opt >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
#9/16 Check if nginx is installed
echo "2/10 Check if nginx is installed" >> /opt/archive/output.txt
echo "Commands to use: " >> /opt/archive/output.txt
echo "sudo yum search "nginx" " >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
sudo yum search "nginx" >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
#10/16 Install nginx
echo "3/10 Install nginx" >> /opt/archive/output.txt
echo "Commands to use: " >> /opt/archive/output.txt
echo "sudo amazon-linux-extras install -y nginx1" >> /opt/archive/output.txt
sudo amazon-linux-extras install -y nginx1
echo " " >> /opt/archive/output.txt
#11/16 Verify that nginx is installed and running
echo "4/10 Verify that nginx is installed and running" >> /opt/archive/output.txt
echo "Commands to use: " >> /opt/archive/output.txt
echo "ps -ef | grep nginx" >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
ps -ef | grep nginx >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
#12/16 Archive files in /etc/nginx
echo "5/10 Archive files in /etc/nginx" >> /opt/archive/output.txt
echo "Commands to use: " >> /opt/archive/output.txt
echo "cd /etc" >> /opt/archive/output.txt
echo "sudo tar -czvf nginxarchived.tar.gz /etc/nginx" >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
cd /etc
sudo tar -czvf nginxarchived.tar.gz /etc/nginx
sudo grep /etc 'nginxarchived.tar.gz'>> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
#13/16 Move nginxarchived.tar.gz to /opt/archive
echo "6/10 Move nginxarchived.tar.gz to /opt/archive" >> /opt/archive/output.txt
echo "Commands to use: " >> /opt/archive/output.txt
echo "sudo mv nginxarchived.tar.gz /opt/archive" >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
sudo mv nginxarchived.tar.gz /opt/archive
cd /opt/archive
echo " " >> /opt/archive/output.txt
ls -la >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
#14/16 Create user called director
echo "7/10 Create a user called director" >> /opt/archive/output.txt
echo "Commands to use: " >> /opt/archive/output.txt
echo "sudo useradd director" >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
sudo useradd director
sudo grep 'director' /etc/passwd >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
#15/16 Create group called maintainers
echo "8/10 Create a group called maintainers" >> /opt/archive/output.txt
echo "Commands to use: " >> /opt/archive/output.txt
echo "sudo groupadd maintainers" >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
sudo groupadd maintainers
sudo grep 'maintainers' /etc/group>> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
#16/16 Change ownership of dir archive and all files inside to user director and group maintainers.
echo "9/10 Change ownership of dir archive and all files inside to user" >> /opt/archive/output.txt
echo "Commands to use: " >> /opt/archive/output.txt
echo "sudo chown -R director:maintainers /opt/archive" >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
sudo chown -R director:maintainers /opt/archive
ls -la /opt >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
ls -la /opt/archive >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
#16/n Change rights for maintainers for dir archive and all files inside to rwx
echo "10/10 Change rights for maintainers for dir archive and all files inside to rwx" >> /opt/archive/output.txt
echo "Commands to use: " >> /opt/archive/output.txt
echo "sudo chmod -R 775 /opt/archive" >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
sudo chmod -R 775 /opt/archive
sudo chmod 777 /opt/archive/output.txt
ls -la /opt >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
ls -la /opt/archive >> /opt/archive/output.txt
echo " " >> /opt/archive/output.txt
sudo chmod 775 /opt/archive/output.txt
EOF
echo "Process complete!"