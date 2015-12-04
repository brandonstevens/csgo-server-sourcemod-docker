FROM brandonstevens/csgo-server

ENV METAMOD_VERSION 1.10.6

ENV SOURCEMOD_VERSION 1.7.3-git5275

USER daemon

RUN curl http://mirror.pointysoftware.net/alliedmodders/mmsource-$METAMOD_VERSION-linux.tar.gz | tar xvz -C /home/daemon/csgo/server/csgo

RUN curl http://www.sourcemod.net/smdrop/1.7/sourcemod-$SOURCEMOD_VERSION-linux.tar.gz | tar xvz -C /home/daemon/csgo/server/csgo

USER root
