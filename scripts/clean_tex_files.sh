#!/bin/bash

# #############################################################################
# Clean up temporary tex files produced from compiling the .tex manuscript
#
# Author(s): Raul A. Flores
# #############################################################################

cd "$(dirname "$0")"

echo $PWD

rm ../acs-00_main_manuscript.bib
rm ../00_main_manuscript.synctex.gz

rm ../00_main_manuscript.bbl
rm ../00_main_manuscript.blg

rm ../00_main_manuscript.aux
rm ../00_main_manuscript.log

rm ../00_main_manuscript.synctex\(busy\)

rm ../00_main_manuscript.fff
rm ../00_main_manuscript.lof
rm ../00_main_manuscript.ttt
rm ../00_main_manuscript.lot

# currentDate=`date +"%Y%m%d_%H-%m"`
# filename="_00_main_manuscript.pdf"
# echo "$currentDate$filename"
# mv ../00_main_manuscript.pdf ../__old__/"$currentDate$filename"
