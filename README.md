# docker-poloniexlendingbot
Script that generates a docker container for the project poloniexlendingbot

To build run:
```bash
./build version_number
```

To start the project using docker-compose.yeml:

```
version: '2'

services:

  poloniexlendingbot:
    image: gartz/poloniexlendingbot
    restart: always
    ports:
      - "9090:80"
    volumes:
      - ./poloniexlendingbot/default.cfg:/code/default.cfg
      - ./poloniexlendingbot/www/botlog.json:/code/www/botlog.json
```
