Creare Container

sudo chmod +x entrypoint.sh

sudo docker build -t alpine-sshd .

sudo docker run --name OpenSSH_Server -d -p 2200:22 alpine-sshd:latest



SUL Client

Modificare hostname

creare utenza steso nome hostname

Creare le utenze per il tunnel l'utente si chiamera autossh
useradd -m -s /bin/false autossh

Alpine LInux dopo rimuovere password
adduser autossh



Loggarsi come utente autossh
su -s /bin/bash autossh

Generare chiavi SSH sul Server per utente root

ssh-keygen -b 4096 -f ~/$(hostname)


Generare chiavi SSH sul client

ssh-keygen -b 4096 -f ~/.ssh/$(whoami)@$(hostname) -C "$(whoami)@$(hostname)"

chmod 400 ~/.ssh/$(whoami)@$(hostname)*

copia la chiave ssh sul server

AUTOMATICO 

ssh-copy-id -i autossh@$(hostname).pub -p 2200 autossh@130.162.213.149


TEST SSH Connectio

NO NO NO ssh -p 2200 -i ~/.ssh/autossh@$(hostname) autossh@130.162.213.149


INSTALLARE AUTOSSH Sul Client
apt-get update 
apt-get install autossh


Copiare e modificare il file config

copiare e modificare il file autossh.service

systemctl daemon-reload
systemctl start autossh
systemctl status autossh
systemctl enable autossh

AGGIUNGER HOST

sudo -u autossh ssh ssh-server 


ESEGUIRE SCRIPT

Installare sshpass

apk add --update sshpass (già inserito nel container)


lancio script su host remoto

sshpass -p password ssh -p 3000 webcam@localhost 'bash -s' < prova.sh
