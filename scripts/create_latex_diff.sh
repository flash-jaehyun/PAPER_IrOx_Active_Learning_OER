#!/bin/bash

# #########################################################
# Create diff latex docs between current state and v2.0
# #########################################################

latexdiff \
    $gr/PAPER_IrOx_Active_Learning_OER-2.0/PAPER_IrOx_Active_Learning_OER-2.0/00_SI_collated.tex \
    00_SI_collated.tex \
    > diff_SI.tex

latexdiff \
    $gr/PAPER_IrOx_Active_Learning_OER-2.0/PAPER_IrOx_Active_Learning_OER-2.0/00_main_manuscript_collated.tex \
    00_main_manuscript_collated.tex \
    > diff_main_manuscript.tex

# latexdiff \
#     $gr/PAPER_IrOx_Active_Learning_OER-2.0/PAPER_IrOx_Active_Learning_OER-2_collated.tex \
#     00_main_manuscript_collated.tex \
#     > diff.tex
