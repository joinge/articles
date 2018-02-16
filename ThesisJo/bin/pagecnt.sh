#!/bin/bash -e

V1=$(cat cnt.txt)

perl -pe 's/(glsnumberformat\}\{)(\d+)/$1.($2 + '"$V1"')/e' ${1}.glo > ${1}_cumulative.glo

V2=$(pdfinfo ${1}.pdf | grep Pages | awk '{print $2}')
PAGES=$((${V1}+${V2}))
echo ${PAGES} > cnt.txt
echo "====P1: ${1}===="
echo "====V1: ${V1}===="
echo "====V2: ${V2}===="
echo "====Number of pages total: ${PAGES}===="

# perl -pe 's/(glsnumberformat\}\{)(\d+)/$1.($2 + '"$var"')/e' introduction.glo
