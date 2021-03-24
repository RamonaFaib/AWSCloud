import configparser
import subprocess as sp


file = open("output.txt","a")
region = sp.getoutput('curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region')
az_code = sp.getoutput('curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .availabilityZone')
public_ip = sp.getoutput('curl --silent http://169.254.169.254/latest/meta-data/public-ipv4')
private_ip = sp.getoutput('curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .privateIp')
isntance_name = e
instance_id = sp.getoutput('curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .instanceId')
account_id = sp.getoutput('curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .accountId')

variables = ["region", "az_code", "public_ip", "private_ip", "instance_name", "instance_id", "account_id"]
result = [region, az_code, public_ip, private_ip, instance_name, instance_id, account_id]

output = [i + "=" + j for i, j in zip(variables, result)]

with open('output.txt', 'w') as f:
    for item in output:
        f.write("%s\n" % item)

with open(~/.bash_profile, 'a') as f:
    for item in output:
        f.write("%s\n" % item)       
