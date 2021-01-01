function pullmeta
scp -i ~/.ssh/jumpbox-wsbx-utility-dev.pem ec2-user@3.227.241.93:/home/ec2-user/metadatas.zip ./
end
