#!/bin/bash

# Generates png images from a directory of swf files
# Requires SWFTools https://github.com/matthiaskramm/swftools

# Usage: swf2png.sh -o pngs
# -o directory to output png images to

while getopts o: flag
do
    case "${flag}" in
        o) output=${OPTARG};;
    esac
done

for i in $(ls *.swf);
do
    # Get a comma separated list of movie clip IDs.
    movie_clips=$(swfextract $i | awk -F: '/MovieClips/ {print $2}' | sed 's/ID(s) //' );

    # Convert the comma separated list of movie clip IDs to a space separated list.
    movie_clips_list=$(echo $movie_clips | sed 's/,/ /g');

    # Loop through the movie clip IDs and convert each one to a png image.
    for movie_clip_id in $movie_clips_list;
    do
        swfextract -i $movie_clip_id -o tmpswf.swf $i;
        swfrender tmpswf.swf -o $output/$i-$movie_clip_id.png;
    done

    rm tmpswf.swf;
done
