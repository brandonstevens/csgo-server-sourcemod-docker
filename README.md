csgo-server-sourcemod-docker
============

# What is Counter-Strike: Global Offensive?

Counter-Strike: Global Offensive (CS:GO) is an online first-person shooter developed by Hidden Path Entertainment and Valve Corporation. It is the fourth game in the main Counter-Strike franchise.

## SourceMod

This Docker image uses [SourceMod](http://www.sourcemod.net/).

# How to use this image


## Running CSGO Dedicated Server

1. Create a Steam account token here: http://steamcommunity.com/dev/managegameservers.

2. Run the container:

    $ docker run -d -P -e STEAM_GAME_SERVER_TOKEN=1234567890 brandonstevens/csgo-server-sourcemod

### Specifying a SourceMod Admin Config

    $ docker run -d -P -e STEAM_GAME_SERVER_TOKEN=1234567890 -v /home/ubuntu/admins.cfg:/home/daemon/csgo/server/csgo/addons/sourcemod/configs/admins.cfg brandonstevens/csgo-server-sourcemod

### Load a Specific Plugin

    $ docker run -d -P -e STEAM_GAME_SERVER_TOKEN=1234567890 -v /home/ubuntu/admins.cfg:/home/daemon/csgo/server/csgo/addons/sourcemod/configs/admins.cfg -v /home/ubuntu/warmod.smx:/home/daemon/csgo/server/csgo/addons/sourcemod/plugins/warmod.smx brandonstevens/csgo-server-sourcemod

## Environment Variables

The CSGO Dedicated Server image that the SourceMod builds on uses several environment variables which are easy to miss. Please see https://github.com/brandonstevens/csgo-server-sourcemod-docker for more information on the environment variables.

# How to extend this image

If you would like to include specific SourceMod plugins, you can create a simple `Dockerfile` that downloads and extracts the plugins. Note, any files added to the image (e.g. plugins, config files) should be added by the daemon user. The last step in the image should be changing back to the root user.

```dockerfile
FROM brandonstevens/csgo-server-sourcemod

ENV DEATHMATCH_VERSION v2.0.4d

ENV GAME_TYPE 1

ENV GAME_MODE 2

ENV MAPGROUP mp_active

ENV MAP de_dust2

USER daemon

RUN curl -L https://github.com/Maxximou5/csgo-deathmatch/releases/download/$DEATHMATCH_VERSION/deathmatch.zip -o /tmp/deathmatch.zip && \
    unzip -uo /tmp/deathmatch.zip -d /home/daemon/csgo/server/csgo/addons/sourcemod && \
    rm /tmp/deathmatch.zip

USER root
```
