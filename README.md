<p><strong>Creare Container</strong></p>
<p>sudo chmod +x entrypoint.sh</p>
<p>sudo docker build -t alpine-sshd .</p>
<p>sudo docker run --name OpenSSH_Server -d -p 2200:22 alpine-sshd:latest</p></br>

<p><strong>Sul Server Alpine</strong></p>
<p>Alla fine rimuovere password</p></br>

<p><strong>Sul Client</strong></p>
<p>Modificare hostname</p></br>
<p>reboot</p></br>
<p>creare utenza steso nome hostname</p></br>
<p>useradd -m -p password $hostname</p></br>
<p>Creare le utenze per il tunnel, utente autossh</p>
<p>useradd -m -s /bin/false autossh</p></br>

<p>Loggarsi come utente autossh</p>
<p>su -s /bin/bash autossh</p>

<p>Generare chiavi SSH sul client per utente autossh</p>
<p>ssh-keygen -b 4096 -f ~/.ssh/autossh@$(hostname) -C "autossh@$(hostname)"</p>
<p>chmod 400 ~/.ssh/autossh@$(hostname)*</p></br>

<p><strong>copia la chiave ssh sul server</strong></p>
<p>AUTOMATICO</p>
<p>ssh-copy-id -i ~/.ssh/autossh@$(hostname).pub -p 2200 autossh@sshserver.fagnano.eu</p></br>
<p>TEST SSH Connectio</p>
<p>NO NO NO ssh -p 2200 -i ~/.ssh/autossh@$(hostname) autossh@sshserver.fagnano.eu</p></br>

<p><strong>INSTALLARE AUTOSSH e Git Sul Client</strong></p>
<p>apt-get update</p>
<p>apt-get install autossh</p>
<p>apt-get install git -y</p></br>


<p><strong>Clonare repository Git</strong></p>
<p>git clone https://github.com/Millorco/OpenSSH-Docker.git</p></br>

<p><strong>Modifica FILE Client</strong></p>
<p>Copiare e modificare il file config</p>
<p>cp config /home/autossh/.ssh/</p>
<p>chown autossh:autossh /home/autossh/.ssh/config</p></br>

<p>copiare il file autossh.service</p>
<p>cp autossh.service /etc/systemd/system/</p></br>

<p>systemctl daemon-reload</p>
<p>systemctl start autossh</p>
<p>systemctl status autossh</p>
<p>systemctl enable autossh</p></br>

<p><strong>AGGIUNGER HOST</strong></p>
<p>sudo -u autossh ssh ssh-server</p></br>

<p><strong>ESEGUIRE SCRIPT</strong></p>
<p>lancio script su host remoto</p>
<p>sshpass -p password ssh -p 3000 webcam@localhost 'bash -s' < prova.sh</p>
