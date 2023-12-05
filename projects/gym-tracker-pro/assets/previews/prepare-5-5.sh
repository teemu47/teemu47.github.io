#!/bin/bash
input=$1
output=$2
helper_1=helper1.mov
helper_2=helper2.mov

ffmpeg -i $input -vf "scale=1080:1920" $helper_1
ffmpeg -f lavfi -i anullsrc -i $helper_1 -c:v copy -c:a aac -map 0:a -map 1:v -shortest $helper_2
ffmpeg -i $helper_2 -filter:v fps=fps=30 $output

rm $helper_1
rm $helper_2
