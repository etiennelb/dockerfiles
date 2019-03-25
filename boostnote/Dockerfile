FROM debian:stretch
LABEL maintainer "Etienne LE BELLEGUY <hello@etiennelb.com>"

RUN apt-get update
RUN apt-get install -y \
	git \
	gconf2 \
	gconf-service \
	gvfs-bin \
	libasound2 \
	libcap2 \
	libgconf-2-4 \
	libgnome-keyring-dev \
	libgtk2.0-0 \
	libgtk3.0-cil \
	libnotify4 \
	libnss3 \
	libxkbfile1 \
	libxss1 \
	libxtst6 \
	libx11-xcb-dev \
  libcanberra-gtk-module \
	xdg-utils \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENV BOOSTNOTE_VERSION 0.11.15

RUN buildDeps=' \
		ca-certificates \
		curl \
	' \
	&& set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
  && curl -sSL https://github.com/BoostIO/boost-releases/releases/download/v${BOOSTNOTE_VERSION}/boostnote_${BOOSTNOTE_VERSION}_amd64.deb -o /tmp/boostnote-amd64.deb \
	&& dpkg -i /tmp/boostnote-amd64.deb \
	&& rm -rf /tmp/*.deb \
	&& apt-get purge -y --auto-remove $buildDeps

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENV LANG=fr_FR.UTF-8

ENTRYPOINT [ "/entrypoint.sh"]