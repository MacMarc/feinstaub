#!/bin/bash

TZ=UTC;export TZ
day=`date '+%Y-%m-%d'`
datadir="/var/www/wetter/data"
datafile="$datadir/data-esp8266-12795304-$day.csv"
#echo $datafile
#date

PM25=`tail -1 $datafile | awk -F ";" '{ print $9 }'`
PM10=`tail -1 $datafile | awk -F ";" '{ print $8 }'`
TEMP=`tail -1 $datafile | awk -F ";" '{ print $10 }'`
HUM=`tail -1 $datafile | awk -F ";" '{ print $11 }'`

#echo PM2.5 $PM25
#echo PM10  $PM10
#echo TEMP  $TEMP
#echo HUM   $HUM

echo P Feinstaub "PM2.5=$PM25;15;25;|PM10=$PM10;30;50" OK - Feinstaub Werte
echo P Temperatur TEMP=$TEMP OK - Temperatur
echo P Luftfeuchtigkeit HUM=$HUM OK - Relative Feuchtigkeit
