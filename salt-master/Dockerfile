FROM centos:7
MAINTAINER Sascha F. Andreichenko <andreichenko@web.de>
RUN yum update && yum install salt-master -y
COPY setup.sh /opt/setup.sh
ENTRYPOINT ["sh","/opt/setup.sh"]
