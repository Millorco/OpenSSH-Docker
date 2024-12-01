# Dockerfile
FROM alpine:latest

RUN apk add --no-cache \
    bash \
    openssh \
    nano \
    sshpass

RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN adduser -h /home/autossh -s /bin/sh -D autossh
RUN echo -n 'autossh:password' | chpasswd
RUN echo "root:password" | chpasswd
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
COPY entrypoint.sh /
