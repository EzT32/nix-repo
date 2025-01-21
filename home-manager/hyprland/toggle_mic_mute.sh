#!/bin/bash

# Toggle microphone mute
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# Check the current mute state
if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "\[MUTED\]"; then
    # Microphone is muted, turn on the LED
    echo "1" | sudo tee /sys/class/leds/platform\:\:micmute/brightness
else
    # Microphone is unmuted, turn off the LED
    echo "0" | sudo tee /sys/class/leds/platform\:\:micmute/brightness
fi



