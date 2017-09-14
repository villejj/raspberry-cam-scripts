#!/bin/bash

while true; do

DATE=$(date +"%Y-%m-%d-%H%M")

echo taking pic cam-$DATE.jpg

raspistill -o /var/www/html/pics/cam.jpg

convert  /var/www/html/pics/cam.jpg -crop 2250x393+280+900 -colorspace Gray -negate -auto-level -auto-gamma /var/www/html/pics/cam-$DATE.jpg

echo "sleeping..."
sleep 60

done
