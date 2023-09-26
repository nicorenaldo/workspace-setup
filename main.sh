#!/bin/bash

# Intro
zenity --info --title="Fresh Install Tool" --text="Let's walk though what software you want on this installation. First we'll make sure your sources are up to date." --width=300 --height=100

if [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Fedora"* ]]; then
   echo "Fedora detected"
   lib/fedora.sh

elif [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Ubuntu"* ]]; then
   echo "Ubuntu detected"
   lib/ubuntu.sh
fi