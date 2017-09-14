#!/bin/bash

while true; do

echo "first img..."
raspistill -vf -hf -o /var/www/html/pics/cam1.jpg
echo "second img..."
raspistill -vf -hf -o /var/www/html/pics/cam2.jpg

echo "comparing"
# iso arvo -> samanlaiset
# pieni arvo -> erilaiset
val=$(compare -metric PSNR  /var/www/html/pics/cam1.jpg /var/www/html/pics/cam2.jpg /var/www/html/pics/diff.jpg 2>&1)

echo "diff: *$val*"
if [ "$val" == "inf" ]; then
  echo samanlaiset!
elif  (( $(echo "$val < 35.0" | bc -l) )); then
  echo erilaiset!
  DATE=$(date +"%Y-%m-%d-%H%M")
  cp /var/www/html/pics/cam2.jpg /var/www/html/pics/cam-$DATE.jpg
else
  echo jokseenkin samanlaiset!
fi

echo "sleeping..."
sleep 5

done
