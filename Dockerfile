FROM androidsdk/android-30
RUN apt install openssh-server -y \
    && systemctl enable ssh \
    && systemctl start ssh
RUN mkdir -p /root/.ssh \
    && chmod 0700 /root/.ssh \
    && passwd -u root \
    && echo -e "PasswordAuthentication no" >> /etc/ssh/sshd_config \
    && sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
