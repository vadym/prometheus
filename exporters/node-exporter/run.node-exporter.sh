#!/bin/sh

# Published ports are discarded when using host network mode
#  -p '9100:9100' \
docker run -d --name "node-exporter" --restart unless-stopped \
  --network=host \
  -v '/proc:/host/proc' \
  -v '/sys:/host/sys' \
  -v '/:/rootfs' \
  prom/node-exporter:latest \
  '--path.procfs=/host/proc' \
  '--path.sysfs=/host/sys' \
  '--collector.filesystem.ignored-mount-points' \
  "^/(sys|proc|dev|host|etc|rootfs/var/lib/docker/containers|rootfs/var/lib/docker/overlay2|rootfs/run/docker/netns|rootfs/var/lib/docker/aufs)($$|/)"
