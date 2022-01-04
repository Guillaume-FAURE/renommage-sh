#!/bin/bash
for filePDF in $@
do
    TMPTO="$(grep -Eo '[0-9]{4,}' TXT/$(basename ${filePDF%.pdf})-TO.txt)"
    echo "TMPTO = $TMPTO"
    TMPDN="$(grep -Eo '[0-9]{4,}' TXT/$(basename ${filePDF%.pdf})-DN.txt)"
    echo "TMPDN = $TMPDN"
    cp $filePDF "renamedPDF/TO $TMPTO DN $TMPDN.pdf" 
done
echo "Renommage termine"