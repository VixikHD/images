FROM  ubuntu:18.04

ENV   DEBIAN_FRONTEND noninteractive

## add container user
RUN   useradd -m -d /home/container -s /bin/bash container

## update base packages
RUN   dpkg --add-architecture i386
RUN   apt update \
 &&   apt upgrade -y

## install dependencies
RUN   apt install -y libstdc++5:i386

COPY  ./entrypoint.sh /entrypoint.sh
CMD   ["/bin/bash", "/entrypoint.sh"]
