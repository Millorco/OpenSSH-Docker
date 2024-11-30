Creare Container

sudo chmod +x entrypoint.sh

sudo docker build -t alpine-sshd .

sudo docker run --name OpenSSH_Server -d -p 2200:22 alpine-sshd:latest


SUL Client

Modificare hostname

creare utenza steso nome hostname

Creare le utenze per il tunnel l'utente si chiamera autossh
useradd -m -s /bin/false autossh

Loggarsi come utente autossh
su -s /bin/bash autossh

Generare chiavi SSH sul Server per utente root

ssh-keygen -b 4096 -f ~/$(hostname)


Generare chiavi SSH sul client

ssh-keygen -b 4096 -f ~/.ssh/$(whoami)@$(hostname) -C "$(whoami)@$(hostname)"

chmod 400 ~/.ssh/$(whoami)@$(hostname)*

copia la chiave ssh sul server

AUTOMATICO 

ssh-copy-id -i $(whoami)@$(hostname).pub -p 2200 $(hostname)@130.162.213.149


TEST SSH Connectio

ssh -p 2200 -i ~/.ssh/$(whoami)@$(hostname) $(hostname)@130.162.213.149


REVERSE TUnnel 

ssh -R 3000:127.0.0.1:22 -o ExitOnForwardFailure=yes -p 2200 -i ~/.ssh/$(whoami)@$(hostname) $(hostname)@130.162.213.149

ssh -Nf -R 2200:localhost:22 user@computer.esterno

ssh -Ng -R *:2200:localhost:22 $(whoami)@130.162.213.149

ESEGUIRE SCRIPT

Installare sshpass

apk add --update sshpass (già inserito nel container)


lancio script su host remoto

sshpass -p password ssh -p 3000 webcam@localhost 'bash -s' < prova.sh
