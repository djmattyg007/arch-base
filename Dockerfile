FROM base/archlinux:2015.06.01
MAINTAINER djmattyg007

# add install bash script
ADD setup/root/*.sh /root/

# run bash script to update base image, set locale, install supervisor and cleanup
RUN chmod +x /root/*.sh && \
	/bin/bash /root/install.sh

# set environment variable for user nobody
# set environment variable for terminal
# set environment variable for language
ENV HOME=/home/nobody TERM=xterm LANG=en_AU.UTF-8
