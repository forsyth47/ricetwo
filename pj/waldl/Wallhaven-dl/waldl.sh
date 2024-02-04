#!/bin/sh
pwdpath=$(pwd)
python ~/waldl/Wallhaven-dl/wallhaven-dl.py
cd Wallhaven

mkdir vertical_images

# loop through all files in the current directory
for file in *
do
  # check if the file is an image
  if file "$file" | grep -q "image"; then
    # check the dimensions of the image
    dimensions=$(identify -format '%wx%h' "$file")
    width=${dimensions%x*}
    height=${dimensions#*x}
    # if the height is greater than the width, it's a vertical image
    if [ $height -gt $width ]; then
      # move the file to the vertical_images directory
      mv "$file" vertical_images/
    fi
  fi
done

rm -rf vertical_imaesg


mv * ~/rice/Background/Picks

cd $pwdpath
