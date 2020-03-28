FROM java:8

WORKDIR app/

RUN curl -O https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar

COPY eula.txt ./

CMD ["java", "-Xmx6300M", "-Xms6000M", "-jar", "server.jar", "nogui"]
