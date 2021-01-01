function pullmeta
scp -i ~/.ssh/jumpbox-wsbx-utility-dev.pem ec2-user@REDACTED_IP:/home/ec2-user/metadatas.zip ./
end
