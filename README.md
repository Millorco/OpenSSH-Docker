Creare Container

sudo chmod +x entrypoint.sh

sudo docker build -t alpine-sshd .

sudo docker run --name OpenSSH_Server -d -p 2200:22 alpine-sshd:latest

Generare chiavi SSH sul Server per utente root

ssh-keygen -b 4096 -f ~/$(hostname)


Generare chiavi SSH sul client

ssh-keygen -b 4096 -f ~/.ssh/$(whoami)@$(hostname) -C "$(whoami)@$(hostname)"

chmod 400 ~/.ssh/$(whoami)@$(hostname)*

copia la chiave ssh sul server

AUTOMATICO 

ssh-copy-id -i $(whoami)@$(hostname).pub -p 2200 $(hostname)@130.162.213.149


TEST SSH Connectio

ssh -p 2200 $(hostname)@130.162.213.149


MANUALE

cp ./ssh/id_rsa.pub /home/user

mkdir .ssh

chmod  700 .ssh

cat id_rsa.pub >> .ssh/authorized_keys

rm id_rsa.pub

chmod 600 .ssh/authorized_keys




ssh -Nf -R 2200:localhost:22 user@computer.esterno

ssh -Ng -R *:2200:localhost:22 $(whoami)@130.162.213.149
