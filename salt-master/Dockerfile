FROM ubuntu:trusty
MAINTAINER Sascha F. Andreichenko <andreichenko@web.de>
RUN apt-get update && apt-get install -y salt-master
COPY setup.sh /opt/setup.sh
ENTRYPOINT ["sh","/opt/setup.sh"]
