import configparser
import subprocess as sp

file = open("output.txt","a")
region = sp.getoutput('curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region')
az_code = sp.getoutput('curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .availabilityZone')
public_ip = sp.getoutput('curl --silent http://169.254.169.254/latest/meta-data/public-ipv4')
private_ip = sp.getoutput('curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .privateIp')
instance_name = "RamonaFaib_Scripting"
instance_id = sp.getoutput('curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .instanceId')
account_id = sp.getoutput('curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .accountId')

variables = ["REGION", "AZCODE", "PUBLICIP", "PRIVATEIP", "INSTANCENAME", "INSTANCEID", "ACCOUNTID"]
result = [region, az_code, public_ip, private_ip, instance_name, instance_id, account_id]

output = [i + "=" + j for i, j in zip(variables, result)]

with open('output.txt', 'w') as f:
    for item in output:
        f.write("%s\n" % item)

output1 = ["export " + i + "=" + j for i, j in zip(variables, result)]

with open('/home/ec2-user/.bash_profile', 'a') as f:
    for item in output1:
        f.write("%s\n" % item)     
 