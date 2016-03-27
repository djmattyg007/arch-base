FROM base/archlinux:2015.06.01
MAINTAINER djmattyg007

ENV BASEIMAGE_VERSION=2016.03.28-1

# Add install bash script
COPY setup/root/*.sh /root/

# Run bash script to update base image, set locale, install runit and cleanup
RUN /root/install.sh && \
    rm /root/*.sh

# Set environment variables for the nobody user's home directory, the terminal
# and the language
ENV HOME=/home/nobody TERM=xterm LANG=en_AU.UTF-8

COPY runsvinit /
ENTRYPOINT ["/runsvinit"]
