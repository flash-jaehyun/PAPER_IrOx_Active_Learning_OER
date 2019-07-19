#!/bin/sh

# #############################################################################
# aspell spell check
#
# Author(s): Raul A. Flores
# #############################################################################

# dict_file="dictionary_mine_2.txt"
#
# cat ../00_main_manuscript.tex | aspell list -t | sort | uniq > $dict_file
# echo "personal_ws-1.1 en 63" | cat - $dict_file > temp && mv temp $dict_file

main_dict_file="dictionary_main.txt"
aspell --home-dir=. --personal=$main_dict_file -t -c ../00_main_manuscript.tex
