#!/bin/bash

# #########################################################
# Clean up temporary tex files produced from compiling the .tex manuscript
#
# Author(s): Raul A. Flores
# #########################################################

#| - Help message
help_message () {
  echo "***********************************************************"
  echo "Usage:"
  echo "  ./scripts/compile_tex.sh 00_main_manuscript [option]"
  echo "or"
  echo "  ./scripts/compile_tex.sh separate_full"

  echo ""

  echo "Options:"
  echo "  short"
  echo "  full"
  echo "  separate_full"
}


if [ "$1" == "-h" ] ; then
    help_message

    exit 0
fi
#__|

#| - Bash Functions
print_stars () {
  echo "**********************************************************************"
  echo "**********************************************************************"
  echo "**********************************************************************"
  echo "**********************************************************************"
  echo "**********************************************************************"
}

pdflatex_comm () {
  # pdflatex.exe \
  # pdflatex.exe -synctex=1 -interaction=nonstopmode -file-line-error 00_main_manuscript

  # pdflatex -synctex=1 -interaction=nonstopmode -file-line-error 00_main_manuscript
  pdflatex -synctex=1 -interaction=nonstopmode -file-line-error $1

}

bibtex_comm () {
  # bibtex 00_main_manuscript
  bibtex $1
}

full_scheme () {
  pdflatex_comm $1
  print_stars

  bibtex_comm $1
  print_stars

  pdflatex_comm $1
  print_stars

  pdflatex_comm $1
}
#__|

# #########################################################
# CWD should always be root git dir
cd "$(dirname "$0")"
cd ..

# So that lines aren't auto-lined breaked in the output
export max_print_line=1048576


#| - Processing arguments
echo "Printing arguments"
echo $1
echo $2

# if [ ${img:$length:1} == "*"] ;then
#    echo "yes"
# fi


if [ "$1" == "00_main_manuscript.tex" ]; then
  tex_file="00_main_manuscript"
elif [ "$1" == "00_main_manuscript_collated.tex" ]; then
  tex_file="00_main_manuscript_collated"

elif [ "$1" == "00_SI.tex" ]; then
  tex_file="00_SI"
elif [ "$1" == "00_SI_collated.tex" ]; then
  tex_file="00_SI_collated"

elif [ "$1" == "diff.tex" ]; then
  tex_file="diff"

else
  tex_file=$1
fi
#__|

if [ "$2" == "short" ]; then
  #| - short
  echo "Running short compilation scheme (just 1 pdflatex call)"
  echo ""; echo ""

  print_stars
  # pdflatex_comm $1
  pdflatex_comm $1
  print_stars
  #__|
elif [ "$2" == "full" ]; then
  #| - full
  echo "Running full compilation (pdflatex > bibtex > pdflatex > pdflatex)"
  echo ""; echo ""

  print_stars
  # full_scheme $1
  # echo "OKLSJFJSDJFISDIFISDIFISODIFJSD"
  # echo $tex_file
  full_scheme $tex_file
  print_stars
  #__|
elif [ "$1" == "separate_full" ]; then
  #| - full
  echo "Running full compilation scheme to to generate separate main text and SI"
  echo "First we run both 00_main_manuscript and 00_SI, then we run them both again to that proper linking occurs, finall we we clean everything up"

  print_stars

  full_scheme 00_main_manuscript
  full_scheme 00_SI

  full_scheme 00_main_manuscript
  full_scheme 00_SI

  # ./scripts/clean_tex_files.sh

  print_stars
  #__|
else
  #| - else
  echo "Need to give an argument, choose among these options"
  help_message
  #__|
fi
