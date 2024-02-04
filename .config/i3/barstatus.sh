#!/bin/bash

killall bumblebee-status
setsid $HOME/.local/bin/bumblebee-status \
       -m cpu battery time amixer \
       -p root.path=/ time.format="%H:%M" date.format="%a, %b %d %Y" \
       -t custom


