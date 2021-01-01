function eftp
	cd ~/.ssh
sftp -i jumpbox-wsbx-utility-dev.pem ec2-user@REDACTED_IP
end
