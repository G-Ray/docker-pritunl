FROM lsiobase/xenial
MAINTAINER Geoffrey Bonneville

# global environment settings
ENV DEBIAN_FRONTEND="noninteractive"

# add local files
COPY root/ /

# import keys
RUN \
#  apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 42F3E95A2C4F08279C4960ADD68FA50FEA312927 && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A

# install packages
RUN \
  apt-get update && \

  apt-get install -y \
    iptables \
    pritunl

# cleanup
RUN \
  apt-get clean && \
  rm -rf \
   /tmp/* \
   /var/lib/apt/lists/* \
   /var/tmp/*
