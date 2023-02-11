#!/bin/sh

echo continuing to download a total of several gigabytes of images to the maxar directory...
mkdir -p maxar

cat maxar-satelitte-images.txt |
  xargs -I{} -n1 -P4 bash -c 'curl -sSLo maxar/$(echo $1 | sed "s/.*ard\/\(.*tif\)/\1/g;s/\//-/g") $1 -C -' - {}
