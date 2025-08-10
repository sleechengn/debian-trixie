environment variable:

ROOT_PASSWORD: init password, can change

ssh:   ip:22

ttyd:  http://ip/ttyd

filebrowser:  http://ip/filebrowser

```
networks:
  lan13:
    name: lan13
    driver: macvlan
    driver_opts:
      parent: eth1
    ipam:
      config:
        - subnet: "192.168.13.0/24"
          gateway: "192.168.13.1"
services:
  debian-bookworm:
    container_name: "debian-bookworm"
    hostname: "debian-bookworm"
    image: "sleechengn/debian:bookworm"
    restart: unless-stopped
    environment:
      - ROOT_PASSWORD=123456
      - TZ=Asia/Shanghai
    networks:
      lan13:
        ipv4_address: 192.168.13.63
```
