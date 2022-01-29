FROM ubuntu as builder

ENV VERSION=1.18.2.03

COPY Repository/bedrock-server-${VERSION}.zip /root/bedrock-server-${VERSION}.zip

RUN apt-get -y update && apt-get -y install unzip

WORKDIR /root/minecraft

RUN mkdir -p /root/minecraft \
    && cd /root/minecraft \
    && unzip /root/bedrock-server-${VERSION}.zip

FROM ubuntu

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install \
    libssl1.1

COPY --from=builder /root/minecraft/ /root/minecraft/

WORKDIR /root/minecraft

CMD LD_LIBRARY_PATH=/root/minecraft /root/minecraft/bedrock_server

EXPOSE 19132
