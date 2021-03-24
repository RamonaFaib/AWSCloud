#! /bin/bash
# Set default SSH port to 443 (to test health check port between LB and private instances)
sed -i 's/Port 22/Port 443/g' /etc/ssh/sshd_config
sed -i 's/#Port 443/Port 443/g' /etc/ssh/sshd_config
service sshd restart
#1. Install docker on EC2
sudo amazon-linux-extras install docker -y
#2. Start docker
sudo service docker start
#3. Add user to docker group
sudo usermod -a -G docker ec2-user
#5. run "docker ps" to check if docker works
#6. Install git
sudo yum install git -y
#7. Clone repo with needed files
git clone https://github.com/RamonaFaib/DockerTask1 Dockertask
#8. cd into Dockertask
cd Dockertask
#9. Rename Dockerfile
mv Dockerfile.bat Dockerfile
#10. Build image
docker image build --tag taskimage .
#11. Run container with taskimage image
docker container run -dt -p 20100:80/tcp --name dockertask taskimage
