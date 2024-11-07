

sudo chmod +x entrypoint.sh


sudo docker build -t alpine-sshd .



sudo docker run --name OpenSSH_Server -d -p 2200:22 alpine-sshd:latest




Now you can ssh into it:
ssh test@docker-sever-ip-here
