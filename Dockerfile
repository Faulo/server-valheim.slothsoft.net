FROM ubuntu:22.04
LABEL vendor=Iron\ Gate\ Studio \
      se.irongatestudio.last-change="2022-09-29"
RUN apt-get update && apt-get install -y \
    curl \
    libatomic1 \
    libpulse-dev \
    libpulse0 \
    && rm -rf /var/lib/apt/lists/*

# Steam SDK
RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y lib32gcc-s1
COPY steam/steamcmd /bin
RUN chmod -R 777 /bin
RUN steamcmd --help
RUN steamcmd +force_install_dir /irongate +login anonymous +app_update 896660 validate +exit

# Path
COPY steamclient.so /usr/lib
WORKDIR /irongate
ENV PATH="/irongate:${PATH}"
CMD /bin/bash
