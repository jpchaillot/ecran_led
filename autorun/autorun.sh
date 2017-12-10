#!/bin/bash

until [ ]
do
	for image in `ls /home/pi/ecran_led/autorun/*.ppm 2>/dev/null`
	do
		largeur=`identify -format %w $image`
		let "temps = largeur/32 +2"
		sudo /home/pi/ecran_led/examples-api-use/demo -t $temps -D1 $image --led-chain=3
	done

	for animation in `ls /home/pi/ecran_led/autorun/*.gif 2>/dev/null`
	do
		sudo /home/pi/ecran_led/utils/led-image-viewer -l 3 $animation
	done
done
