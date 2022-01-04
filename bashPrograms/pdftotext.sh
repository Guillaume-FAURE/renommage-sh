#!/bin/bash
for filePDF in $@
do
    pdftk "$filePDF" cat 1 output "$(basename ${filePDF%.pdf})-page1.pdf"
    convert -geometry 1600x1600 -colorspace Gray -density 200x200 -quality 100 "$(basename ${filePDF%.pdf})-page1.pdf" "$(basename ${filePDF%.pdf})-page1.png"
    convert "$(basename ${filePDF%.pdf})-page1.png" -crop 400x50+0+200 "$(basename ${filePDF%.pdf})-TO.png"
    convert "$(basename ${filePDF%.pdf})-page1.png" -crop 400x100+0+400 "$(basename ${filePDF%.pdf})-DN.png"
    tesseract --psm 11 "$(basename ${filePDF%.pdf})-TO.png" "TXT/$(basename ${filePDF%.pdf})-TO" &>/dev/null 
    tesseract --psm 11 "$(basename ${filePDF%.pdf})-DN.png" "TXT/$(basename ${filePDF%.pdf})-DN" &>/dev/null
    rm -f "$(basename ${filePDF%.pdf})-TO.png" "$(basename ${filePDF%.pdf})-DN.png" "$(basename ${filePDF%.pdf})-page1.png" "$(basename ${filePDF%.pdf})-page1.pdf"
    echo "Texte extrait de ${filePDF}"
done
echo "Extraction des textes termines"