# Dockerfile
FROM alpine:latest

RUN apk add --no-cache \
    bash \
    openssh \
    nano 

RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN adduser -h /home/test -s /bin/sh -D test
RUN echo -n 'test:69R%MYjRmL' | chpasswd
RUN echo "root:password" | chpasswd
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
COPY entrypoint.sh /
