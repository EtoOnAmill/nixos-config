#!/bin/sh

ST=$(bspc query --tree -d | grep "kitty" -o | wc -l)

kitty &

while [ $ST -eq $(bspc query --tree -d | grep "kitty" -o | wc -l) ]
do
	sleep 0.01
done

sleep 0 && bspc node -t floating && bspc node -z top_left -300 -200 && bspc node -z bottom_right 300 200
