FROM base/archlinux:2015.06.01
MAINTAINER djmattyg007

ENV BASEIMAGE_VERSION=2017.01.12-2

# Add install bash script
COPY setup/root/*.sh /root/

# Run bash script to update base image, set locale, install runit and cleanup
RUN /root/install.sh && \
    rm -f /root/install.sh /root/pacman-init.sh

# Set environment variable for language
ENV LANG=en_AU.UTF-8
