FROM base/archlinux:2015.06.01
MAINTAINER djmattyg007

ENV BASEIMAGE_VERSION=2016.03.27

# Add install bash script
ADD setup/root/*.sh /root/

# Run bash script to update base image, set locale, install runit and cleanup
RUN chmod +x /root/*.sh && \
    /bin/bash /root/install.sh && \
    rm /root/*.sh

# Set environment variables for the nobody user's home directory, the terminal
# and the language
ENV HOME=/home/nobody TERM=xterm LANG=en_AU.UTF-8

ADD runsvinit /
ENTRYPOINT ["/runsvinit"]
