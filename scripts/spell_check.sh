#!/bin/sh

# #############################################################################
# aspell spell check
#
# Author(s): Raul A. Flores
# #############################################################################

cd "$(dirname "$0")"
echo $PWD

# dict_file="dictionary_mine_2.txt"
# cat ../00_main_manuscript.tex | aspell list -t | sort | uniq > $dict_file
# echo "personal_ws-1.1 en 63" | cat - $dict_file > temp && mv temp $dict_file


main_dict_file="./dictionaries/dict_main.txt"
names_dict_file="./dictionaries/dict_names.txt"
acro_dict_file="./dictionaries/dict_acronyms.txt"

# Flags
tmp0="--personal=$main_dict_file --add-extra-dicts=$names_dict_file"
tmp1=" --add-extra-dicts=$acro_dict_file -t -c"
flags=$tmp0$tmp1

aspell --home-dir=. $flags ../00_main_manuscript.tex
aspell --home-dir=. $flags ../03_sections/00_abstract.tex
aspell --home-dir=. $flags ../03_sections/01_introduction.tex
aspell --home-dir=. $flags ../03_sections/02_00_section.tex
aspell --home-dir=. $flags ../03_sections/02_01_section.tex
aspell --home-dir=. $flags ../03_sections/02_02_section.tex
aspell --home-dir=. $flags ../03_sections/03_conclusions.tex
aspell --home-dir=. $flags ../03_sections/04_00_section.tex
aspell --home-dir=. $flags ../03_sections/acknowledgements.tex
aspell --home-dir=. $flags ../03_sections/authors.tex
aspell --home-dir=. $flags ../03_sections/custom_macros.tex



#| - __old__
# flags="--personal=$main_dict_file --add-ex
# tra-dicts=$names_dict_file --add-extra-dicts=$acro_dict_file"


# aspell --home-dir=. $flags -t -c ../00_main_manuscript.tex
# aspell --home-dir=. $flags -t -c ../03_sections/00_abstract.tex
# aspell --home-dir=. $flags -t -c ../03_sections/01_introduction.tex
# aspell --home-dir=. $flags -t -c ../03_sections/02_00_section.tex
# aspell --home-dir=. $flags -t -c ../03_sections/02_01_section.tex
# aspell --home-dir=. $flags -t -c ../03_sections/02_02_section.tex
# aspell --home-dir=. $flags -t -c ../03_sections/03_conclusions.tex
# aspell --home-dir=. $flags -t -c ../03_sections/04_00_section.tex
# aspell --home-dir=. $flags -t -c ../03_sections/acknowledgements.tex
# aspell --home-dir=. $flags -t -c ../03_sections/authors.tex
# aspell --home-dir=. $flags -t -c ../03_sections/custom_macros.tex

# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=$names_dict_file --add-extra-dicts=$acro_dict_file -t -c ../00_main_manuscript.tex
# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=$names_dict_file --add-extra-dicts=$acro_dict_file -t -c ../03_sections/00_abstract.tex
# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=$names_dict_file --add-extra-dicts=$acro_dict_file -t -c ../03_sections/01_introduction.tex
# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=$names_dict_file --add-extra-dicts=$acro_dict_file -t -c ../03_sections/02_00_section.tex
# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=$names_dict_file --add-extra-dicts=$acro_dict_file -t -c ../03_sections/02_01_section.tex
# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=$names_dict_file --add-extra-dicts=$acro_dict_file -t -c ../03_sections/02_02_section.tex
# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=$names_dict_file --add-extra-dicts=$acro_dict_file -t -c ../03_sections/03_conclusions.tex
# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=$names_dict_file --add-extra-dicts=$acro_dict_file -t -c ../03_sections/04_00_section.tex
# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=$names_dict_file --add-extra-dicts=$acro_dict_file -t -c ../03_sections/acknowledgements.tex
# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=$names_dict_file --add-extra-dicts=$acro_dict_file -t -c ../03_sections/authors.tex
# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=$names_dict_file --add-extra-dicts=$acro_dict_file -t -c ../03_sections/custom_macros.tex



# aspell --home-dir=. --personal=$main_dict_file -t -c ../03_sections/02_02_section.tex.bak



# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=./dictionary_test.txt -t -c ../00_main_manuscript.tex
# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=dictionary_main.txt -t -c ../00_main_manuscript.tex
# aspell --home-dir=. --personal=$main_dict_file --add-extra-dicts=./dictionary_main.txt -t -c ../00_main_manuscript.tex
#__|
