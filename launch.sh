#!/usr/bin/env bash

# Mevcut panelleri öldür
killall -q polybar

# Ana barı başlat
polybar example 2>&1 | tee -a /tmp/polybar.log & disown
