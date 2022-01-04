#!/bin/bash
bash bashPrograms/pdftotext.sh PDF/*.pdf
bash bashPrograms/renameTO-DN.sh PDF/*.pdf
echo "Programme termine"