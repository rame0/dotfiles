#!/usr/bin/env bash


status=$(LANG='en_US.UTF8' yandex-disk status | grep -oP 'Synchronization core status: \K(.*?)$')

icon="exclamation-circle"

if [ $status = "no internet access" ]; then
    icon="ban";
elif [ $status = "idle" ]; then
    icon="weather_clouds";
elif [ $status = "busy"]; then
    icon="refresh";
elif [ $status = "paused"]; then
    icon="pause";
fi

echo "{\"icon\":\"${icon}\", \"text\":\"Я.Д.\" }"

