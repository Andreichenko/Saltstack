FROM centos:7
MAINTAINER Sascha F. Andreichenko <andreichenko@web.de>
RUN yum update && yum install salt-minion curl -y
COPY setup.sh /opt/setup.sh
ENTRYPOINT ["sh","/opt/setup.sh"]
