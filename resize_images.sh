#! /bin/bash

# https://superuser.com/questions/71028/batch-converting-png-to-jpg-in-linux
# https://imagemagick.org/script/command-line-options.php#resize
# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
PWD=${pwd}

DIR=PWD
SIZE=100
EXT=png
while [[ "$#" -gt 0 ]]; do case $1 in
  -h|--help) echo "USAGE: resize_images.sh -d ../Pictures/test/ -e png -s 101"; exit 1;;
  -d|--dir) DIR="$2"; shift;;
  -e|--ext) EXT="$2"; shift;;
  -s|--size) SIZE="$2"; shift;;
  *) echo "Unknown parameter passed: $1"; exit 1;;
esac; shift; done


echo "DIR: ${DIR} " 
echo "PWD: ${PWD} "
echo "SIZE: ${SIZE} "
echo "EXT: ${EXT} "
cd $DIR


COUNTER=0
for img in *.${EXT}; do
    filename=${img%.*}
    convert "$filename.${EXT}" -resize ${SIZE}% "$filename.${EXT}"
    ((COUNTER++))
done
echo "${COUNTER} files converted"

cd $PWD
