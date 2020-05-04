#!/bin/bash

# #########################################################
# Clean up temporary tex files produced from compiling the .tex manuscript
#
# Author(s): Raul A. Flores
# #########################################################

#| - Help message
if [ "$1" == "-h" ] ; then
    # echo "Usage: `basename $0` [-h]"
    echo "Usage:"
    echo "clean_tex_files remove_pdf"
    exit 0
fi
#__|

cd "$(dirname "$0")"
echo $PWD


rm ../acs-*.bib
rm ../*.synctex.gz
rm ../*.bbl
rm ../*.blg
rm ../*.aux
rm ../*.log
rm ../*.synctex\(busy\)
rm ../*.fff
rm ../*.lof
rm ../*.ttt
rm ../*.lot


rm ../*_collated*

rm -r ../active_learned_irox_polymorphs*

if [ "$1" == "remove_pdf" ]; then
  rm ../*.pdf
fi



#| - __old__

# #########################################################
#| - Main tex file
# rm ../acs-00_main_manuscript.bib
# rm ../00_main_manuscript.synctex.gz
#
# rm ../00_main_manuscript.bbl
# rm ../00_main_manuscript.blg
#
# rm ../00_main_manuscript.aux
# rm ../00_main_manuscript.log
#
# rm ../00_main_manuscript.synctex\(busy\)
#
# rm ../00_main_manuscript.fff
# rm ../00_main_manuscript.lof
# rm ../00_main_manuscript.ttt
# rm ../00_main_manuscript.lot
#__|

# #########################################################
#| - SI tex file
# rm ../acs-00_SI.bib
# rm ../00_SI.synctex.gz
#
# rm ../00_SI.bbl
# rm ../00_SI.blg
#
# rm ../00_SI.aux
# rm ../00_SI.log
#
# rm ../00_SI.synctex\(busy\)
#
# rm ../00_SI.fff
# rm ../00_SI.lof
# rm ../00_SI.ttt
# rm ../00_SI.lot
#__|


# currentDate=`date +"%Y%m%d_%H-%m"`
# filename="_00_main_manuscript.pdf"
# echo "$currentDate$filename"
# mv ../00_main_manuscript.pdf ../__old__/"$currentDate$filename"
#__|
