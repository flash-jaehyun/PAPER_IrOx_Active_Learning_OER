#!/bin/bash

# #############################################################################
# Clean up temporary tex files produced from compiling the .tex manuscript
#
# Author(s): Raul A. Flores
# #############################################################################

cd "$(dirname "$0")"
echo $PWD

./clean_tex_files.sh
./compile_tex.sh $1
./clean_tex_files.sh

# sumatra ../00_main_manuscript.pdf
