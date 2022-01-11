# link to fix build on Rpi: https://github.com/gliderlabs/docker-alpine/issues/334#issuecomment-879368146
#For Raspberry Pi:

# The answer is this: https://wiki.alpinelinux.org/wiki/Release_Notes_for_Alpine_3.13.0#time64_requirements
# (alpine 3.13 isn't compatible with raspberry pi os by default due to some outdated package)

# [source]

# For Raspberry Pi, you can upgrade libseccomp2 to a supported version from the Debian Repos eg.

# wget http://ftp.de.debian.org/debian/pool/main/libs/libseccomp/libseccomp2_2.5.1-1_armhf.deb
# dpkg -i libseccomp2_2.5.1-1_armhf.deb
# [source]


FROM alpine:3.14
# hadolint ignore=DL3018
RUN apk add --no-cache tshark coreutils su-exec

COPY run.sh /run.sh

ENV FILTER=""
ENV IFACE="any"
ENV MAXFILESIZE="1000" 
# ENV MAXFILENUM="1000"
ENV FILENAME="dump"
ENV FORMAT="pcapng"
ENV SNAPLENGTH=""
# hadolint ignore=DL3002
USER root

RUN mkdir /data; \
    mkdir /shellscripts; \
    addgroup root wireshark ; \
    chmod 777 /run.sh; \
    chmod 777 /usr/bin/dumpcap
