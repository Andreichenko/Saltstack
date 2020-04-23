#!/bin/bash

salt_minion_check () {
	if [ ! -f /var/log/salt/minion ]; then
  	  echo "File not found!" && \
          touch /var/log/salt/minion && \
	  salt_minion_check
	else
	  tail -f /var/log/salt/minion
	fi
}
