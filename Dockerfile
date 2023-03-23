FROM ubuntu:22.04
LABEL vendor=Iron\ Gate\ Studio \
      se.irongatestudio.last-change="2022-09-29"

# Linux
RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y \
    curl \
    libatomic1 \
    libpulse-dev \
    libpulse0 \
	lib32gcc-s1
RUN rm -rf /var/lib/apt/lists/*

# steamcmd
COPY steam/steamcmd /var/steam
RUN chmod -R 777 /var/steam
RUN /var/steam/steamcmd --help
RUN /var/steam/steamcmd +force_install_dir /irongate +login anonymous +app_update 896660 validate +exit

# steamclient
COPY steamclient.so /usr/lib

# PATH
WORKDIR /irongate
ENV PATH="/irongate:${PATH}"
CMD /bin/bash

# Server
EXPOSE 2456/udp
EXPOSE 2457/udp
EXPOSE 2456/tcp
EXPOSE 2457/tcp
EXPOSE 9001/tcp
COPY irongate /irongate
RUN chmod -R 777 /irongate
ENTRYPOINT /irongate/start_server_env.sh
