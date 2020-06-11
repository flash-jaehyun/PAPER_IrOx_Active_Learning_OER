#!/bin/bash

# #############################################################################
# Git diff on just the latex files
#
# Author(s): Raul A. Flores
# #############################################################################


git difftool \
  03_sections/00_abstract.tex \
  03_sections/01_introduction.tex \
  03_sections/02_00__al_method.tex \
  03_sections/02_01__application_to_irox.tex \
  03_sections/02_02__struct_motifs.tex       \
  03_sections/02_03__echem_oer.tex \
  03_sections/03_conclusions.tex \
  03_sections/04_00_SI.tex \
  03_sections/acknowledgements.tex \
  # 03_sections/acronyms_vars.md \
  03_sections/authors.tex \
  03_sections/custom_macros.tex \
  03_sections/title.tex \
