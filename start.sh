#!/usr/bin/env bash

sleep-with-countdown() {
  secs=$1
  while [ $secs -gt 0 ]; do
    printf "\rsleep: $secs\033[0K"
    sleep 1
    : $((secs--))
  done
  printf "\n"
}

ps -eaf

curl -s ipinfo.io
sleep 5
gunicorn server:app --bind 0.0.0.0:$PORT &

while sleep 158; do curl 0.0.0.0:$PORT -s; done
