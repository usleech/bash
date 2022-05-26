#!/usr/bin/env bash

curl -s ipinfo.io
sleep 5
gunicorn server:app --bind 0.0.0.0:$PORT &

while sleep 158; do curl 0.0.0.0:$PORT -s; done
