
sudo chmod +x entrypoint.sh

sudo docker build -t alpine-sshd .

sudo docker run --name OpenSSH_Server -d -p 2200:22 alpine-sshd:latest


Now you can ssh into it:

ssh test@docker-sever-ip-here


Generare chiavi SSH sul client

ssh-keygen -b 4096 -C "$(whoami)@$(hostname)"

copia la chiave ssh sul server

ssh-copy-id -p 2200 $(whoami)@130.162.213.149


ssh -Nf -R 2200:localhost:22 user@computer.esterno

ssh -Ng -R *:2200:localhost:22 $(whoami)@130.162.213.149
