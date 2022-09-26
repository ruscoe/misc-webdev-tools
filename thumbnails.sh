#!/bin/bash

# Generates square thumbnails from a directory of jpg images.
# Requires ImageMagick https://imagemagick.org/

# Usage: thumbnails.sh -s 300 -o thumbs
# -s pixel size to crop and scale to
# -o directory to output thumbnail images to

while getopts s:o: flag
do
    case "${flag}" in
        s) size=${OPTARG};;
        o) output=${OPTARG};;
    esac
done

for i in $(ls *.jpg);
    do convert -resize "${size}^>" -auto-orient -gravity center -crop "${size}x${size}+0+0" -strip $i "${output}/${i}";
done
