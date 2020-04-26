#!/bin/bash

# #############################################################################
# aspell spell check
#
# Author(s): Raul A. Flores
# #############################################################################

#| - Files to spell check
declare -a StringArray=(
    "../00_main_manuscript.tex"

    "../03_sections/00_abstract.tex"
    "../03_sections/01_introduction.tex"
    "../03_sections/02_00__al_method.tex"
    "../03_sections/02_01__application_to_irox.tex"

    # "../03_sections/02_02__struct_motiffs.tex"
    "../03_sections/02_02__struct_motifs.tex"

    "../03_sections/02_03__echem_oer.tex"
    "../03_sections/03_conclusions.tex"
    "../03_sections/04_00_SI.tex"
    "../03_sections/acknowledgements.tex"
    "../03_sections/acronyms_vars.md"
    "../03_sections/authors.tex"
    "../03_sections/custom_macros.tex"
    )


# "../03_sections/00_abstract.tex"
# "../03_sections/01_introduction.tex"
# "../03_sections/02_00_section.tex"
# "../03_sections/02_01_section.tex"
# "../03_sections/02_02_section.tex"
# "../03_sections/03_conclusions.tex"
# "../03_sections/04_00_SI.tex"
# "../03_sections/acknowledgements.tex"
# "../03_sections/authors.tex"
# "../03_sections/custom_macros.tex"


#__|

#| - Dictionary Files
main_dict_file="./dictionaries/dict_main.txt"
names_dict_file="./dictionaries/dict_names.txt"
acro_dict_file="./dictionaries/dict_acronyms.txt"
misc_dict_file="./dictionaries/dict_misc.txt"
#__|

#| - Flags
tmp0="--personal=$main_dict_file --add-extra-dicts=$names_dict_file"
tmp1=" --add-extra-dicts=$acro_dict_file --add-extra-dicts=$misc_dict_file -t -c"
flags=$tmp0$tmp1
#__|


cd "$(dirname "$0")"

for val in ${StringArray[@]}; do
  echo $val
  echo "#####################################################################"
  cat $val | aspell list --encoding utf-8 $flags
  echo ""
done




#| - __old__
# for val in ${StringArray[@]}; do
#     echo $val
#     echo "#####################################################################"
#     aspell --home-dir=. $flags $val
#     echo ""
# done

# aspell --home-dir=. $flags ../00_main_manuscript.tex
# aspell --home-dir=. $flags ../03_sections/00_abstract.tex
# aspell --home-dir=. $flags ../03_sections/01_introduction.tex
# aspell --home-dir=. $flags ../03_sections/02_00_section.tex
# aspell --home-dir=. $flags ../03_sections/02_01_section.tex
# aspell --home-dir=. $flags ../03_sections/02_02_section.tex
# aspell --home-dir=. $flags ../03_sections/03_conclusions.tex
# aspell --home-dir=. $flags ../03_sections/04_00_SI.tex
# aspell --home-dir=. $flags ../03_sections/acknowledgements.tex
# aspell --home-dir=. $flags ../03_sections/authors.tex
# aspell --home-dir=. $flags ../03_sections/custom_macros.tex
#__|
