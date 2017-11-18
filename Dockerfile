FROM debian:stable-slim

WORKDIR /tmp

RUN set -ex \
&& buildDeps='unzip curl wget nano' \
&& runtimeDeps='ca-certificates libfreetype6:i386 libssh2-1:i386 libssl1.0.2:i386 libstdc++6:i386' \
&& dpkg --add-architecture i386 \
&& apt-get update \
&& apt-get --assume-yes --no-install-recommends install $buildDeps $runtimeDeps \
&& mkdir --parents /opt/pharo \
&& cd /opt/pharo \
&& wget -O- get.pharo.org | bash

WORKDIR /opt/pharo

#End
RUN echo "Installed!!"
