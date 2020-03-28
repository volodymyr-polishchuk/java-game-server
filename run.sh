#!/bin/bash

echo "Stop old server";

docker stop minecraft-server;

echo "Remove old backup";

docker rm minecraft-server-old;

echo "Create new backup";

docker rename minecraft-server minecraft-server-old;

echo "Start new version";

IT='';
DETACH='-d';

if [[ ! -z "${1}" ]]; then
	IT='-it';
	DETACH='';
fi;

docker run \
	${DETACH} \
	-p 4000:25565 \
	-v server.properties:/app/server.properties \
	-v ops.json:/app/ops.json \
	-v worlds/world:/app/world \
    -v logs:/app/logs \
    -v server-icon.png:/app/server-icon.png \
	--restart always \
	--memory 6500mb \
	--name minecraft-server \
	${IT}\
	minecraft-server:latest \
	${1:-};

