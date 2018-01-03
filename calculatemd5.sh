#!/bin/bash

outputcsv=$2

list=$(find $1 -type file)

IFS=$'\n'

for i in $list; do
	md5=$(md5 < "$i")
	size=$(wc -c < "$i")
	echo "$md5:$i:${size// /}" >> $outputcsv
done