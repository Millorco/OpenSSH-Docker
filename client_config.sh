#!/bin/bash
# Ask the user for their name
echo Inserisci il nume della Webcam
read hostname
echo Nuovo dispositivo  $hostname
echo "$hostname" > /etc/hostname

echo Inserisci l'indirizzo del server SSH
read server
echo Il server $server


echo Inserisci la porta tpc per il forward
read port


useradd -m -p password $hostname
echo aggiunto nuovo uetente $hotanme

useradd -m -s /bin/false autossh
echo creata utenta per il tunnel SSH

su -s /bin/bash autossh
ssh-keygen -b 4096 -f ~/.ssh/$(whoami)@$(hostname) -C "$(whoami)@$(hostname)"
chmod 400 ~/.ssh/$(whoami)@$(hostname)*

ssh-copy-id -i autossh@$(hostname).pub -p 2200 autossh@$server


exit

apt-get update
apt-get install autossh

cp autossh.service /etc/systemd/system/autossh.service

echo "   HostName      $server" >> /home/autossh/.ssh/config
echo "   RemoteForward  $port localhost:22" >> /home/autossh/.ssh/config
echo "   IdentityFile ~/.ssh/autossh@$(hostname)" >> /home/autossh/.ssh/config

systemctl daemon-reload
systemctl start autossh
systemctl status autossh
systemctl enable autossh

sudo -u autossh ssh ssh-server
