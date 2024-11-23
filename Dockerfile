# Dockerfile
FROM alpine:latest

RUN apk add --no-cache \
    bash \
    openssh \
    nano 

RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN adduser -h /home/villa-aylin -s /bin/sh -D villa-aylin
RUN echo -n 'villa-aylin:password' | chpasswd
RUN echo "root:password" | chpasswd
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
COPY entrypoint.sh /
