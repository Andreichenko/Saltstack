FROM ubuntu:trusty
MAINTAINER Sascha F. Andreichenko <andreichenko@web.de>
RUN apt-get update && apt-get install -y salt-minion curl
COPY setup.sh /opt/setup.sh
ENTRYPOINT ["sh","/opt/setup.sh"]
