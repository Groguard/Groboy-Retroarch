FROM arm32v6/alpine

# Update and install packages needed to build retroarch
RUN apk update && apk add openssh --no-cach
RUN mkdir /var/run/sshd
RUN echo 'root:groboy' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#Port 22/Port 7777/' /etc/ssh/sshd_config
RUN /usr/bin/ssh-keygen -t rsa -N '' -f /etc/ssh/ssh_host_rsa_key && \
    /usr/bin/ssh-keygen -t dsa -N '' -f /etc/ssh/ssh_host_dsa_key && \
    /usr/bin/ssh-keygen -t ecdsa -N '' -f /etc/ssh/ssh_host_ecdsa_key && \
    /usr/bin/ssh-keygen -t ed25519 -N '' -f /etc/ssh/ssh_host_ed25519_key

RUN mkdir /root/games
RUN mkdir /root/saves

EXPOSE 7777
CMD ["/usr/sbin/sshd", "-D"]
