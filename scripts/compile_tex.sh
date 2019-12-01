#!/bin/bash

# #############################################################################
# Clean up temporary tex files produced from compiling the .tex manuscript
#
# Author(s): Raul A. Flores
# #############################################################################

# CWD should always be root git dir
cd "$(dirname "$0")"
cd ..

# So that lines aren't auto-lined breaked in the output
export max_print_line=1048576
# export max_print_line=80

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
  pdflatex -synctex=1 -interaction=nonstopmode -file-line-error 00_main_manuscript
  # pdflatex.exe -synctex=1 -interaction=nonstopmode -file-line-error 00_main_manuscript
}

bibtex_comm () {
  bibtex 00_main_manuscript
}

full_scheme () {
  pdflatex_comm
  print_stars

  bibtex_comm
  print_stars

  pdflatex_comm
  print_stars

  pdflatex_comm
}
#__|

print_stars
if [ "$1" == "short" ]; then
  #| - short
  echo "Running short compilation scheme (just 1 pdflatex call)"
  echo ""; echo ""

  pdflatex_comm
  print_stars
  #__|
elif [ "$1" == "full" ]; then
  #| - full
  echo "Running full compilation (pdflatex > bibtex > pdflatex > pdflatex)"
  echo ""; echo ""

  full_scheme
  #__|
else
  #| - else
  echo "Run script with either of these options:"
  echo "'short'"
  echo "'full'"
  echo ""; echo ""
  #__|
fi
print_stars
