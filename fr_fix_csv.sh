#!/bin/bash

# unzips, converts the csv file encoding to utf-8, replaces corrupted Côte d'voire name and private use unicode characters

mkdir -p tmp
unzip 20181128-184104_fr-fr_translations.zip -d tmp

iconv -f ISO-8859-1 -t utf8 < tmp/fr-fr/Remitly_project_1.csv > tmp/french_converted.utf8.csv

# fix "Côte d'voire" getting corrupted by script TODO fix in Caribou, Client Service
sed -i bak "s/^\\(.*::CIV\\),,.*$/\\1,,Côte d'voire,Côte d'voire/g" tmp/french_converted.utf8.csv
dos2unix tmp/french_converted.utf8.csv

# cp1252 quote encodings are still leftover convert to correct hex codes
# replace with function call output https://stackoverflow.com/questions/5777170/substitution-with-sed-bash-function

# https://unix.stackexchange.com/questions/435043/replace-utf-8-characters-with-shell-perl
# ... elipses
perl -CSD -Mutf8 -pe "s/\\xe2\\x80\\xa6/\\x{2026}/g" tmp/french_converted.utf8.csv | 
# left single quote
perl -CSD -Mutf8 -pe "s/\\xc2\\x91|\\xe2\\x80\\x98/\\x{2018}/g" tmp/french_converted.utf8.csv | 
# right single quote
perl -CSD -Mutf8 -pe "s/\\xc2\\x92|\\xe2\\x80\\x99/\\x{2019}/g" |
# left double quote
perl -CSD -Mutf8 -pe "s/\\xc2\\x93|\\xe2\\x80\\x9c/\\x{201c}/g" |
# right double quote
perl -CSD -Mutf8 -pe "s/\\xc2\\x94|\\xe2\\x80\\x9d/\\x{201d}/g" > french_content.csv

rm -rf tmp/
