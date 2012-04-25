#!/bin/bash

golemini='64x 128x 256x 512x 640x 800x 1024x original'
tipovi='horizontal vertical'

for tip in $tipovi; do
    for golemina in $golemini; do
        if [ ! -d $tip/png/$golemina ]; then
           mkdir -p $tip/png/$golemina
        fi

        for slika in `find $tip/ -name "*.svg" -printf "%f\n"`; do
            if [ $golemina == "original" ]; then
                convert $tip/$slika $tip/png/original/`basename $slika .svg`.png
            else
                convert -resize $golemina $tip/$slika $tip/png/$golemina/`basename $slika .svg`.png
            fi
        done;
    done;
done;
