FROM base/archlinux:2015.06.01
MAINTAINER djmattyg007

# additional files
##################

# add install bash script
ADD setup/root/*.sh /root/

# install app
#############

# run bash script to update base image, set locale, install supervisor and cleanup
RUN chmod +x /root/*.sh && \
	/bin/bash /root/install.sh

# env
#####

# set environment variables for user nobody
# set environment variable for terminal
# set environment variables for language
ENV HOME=/home/nobody TERM=xterm LANG=en_AU.UTF-8

# additional files
##################

# add supervisor configuration file
#ADD setup/supervisor.conf /etc/supervisor.conf
