FROM archlinux/base:latest
MAINTAINER djmattyg007

ENV BASEIMAGE_VERSION=2017.12.21-1

# Add install bash script
COPY setup/root/*.sh /root/

# Run bash script to update base image, install important additional packages, set locale and clean up
RUN /root/install.sh && \
    rm -f /root/install.sh /root/pacman-init.sh

# Set environment variable for language
ENV LANG=en_AU.UTF-8
