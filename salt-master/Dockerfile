FROM centos:7

MAINTAINER Sascha F. Andreichenko <andreichenko@web.de>

#The Salt Bootstrap Script allows a user to install the Salt Minion or Master on a variety of system distributions and version
RUN curl -L https://bootstrap.saltstack.com -o install_salt.sh
###### RUN script for salt
RUN sh install_salt.sh -P -M -X
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done);
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME [ "/sys/fs/cgroup" ]

RUN yum install -y openssh-server \
    openssh-clients

RUN yum clean all

# SSHD settings for root login and install
RUN sed -i -e "s|^#PermitRootLogin .*$|PermitRootLogin yes|" /etc/ssh/sshd_config \
    && sed 's@session\*required\*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd


COPY setup.sh /opt/setup.sh
EXPOSE 4505 4506
ENTRYPOINT ["sh","/opt/setup.sh"]
