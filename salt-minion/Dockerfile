FROM centos:7

MAINTAINER Sascha F. Andreichenko <andreichenko@web.de>

#Install saltstack
RUN curl -L https://bootstrap.saltstack.com -o install_salt.sh
RUN sh install_salt.sh -P -X

#remove some targets
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*; \
rm -f /etc/systemd/system/*.wants/*; \
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

#added cgroup as well
VOLUME [ "/sys/fs/cgroup" ]

#run openssh server
RUN yum install -y openssh-server \
    openssh-clients

RUN yum clean all

# sshd settings
RUN sed -i -e "s|^#PermitRootLogin .*$|PermitRootLogin yes|" /etc/ssh/sshd_config \
    && sed 's@session\*required\*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
    && ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
    && ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa  \
    && ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519  \
    && chmod -R 700 /etc/ssh

# enable services
RUN systemctl enable sshd.service
RUN systemctl enable salt-minion.service

# change the root's password
RUN echo "root:password" | chpasswd

CMD ["/usr/sbin/init"]
