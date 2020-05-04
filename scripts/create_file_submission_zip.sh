#!/bin/bash

# #########################################################
# Creating final .zip directory of all needed .tex files for submission
# #########################################################


final_sub_dir=active_learned_irox_polymorphs

mkdir $final_sub_dir

# Compy home folder files
# cp 00_main_manuscript.tex $final_sub_dir/
# cp 00_SI.tex $final_sub_dir/
# cp latex_setup.tex $final_sub_dir/

python scripts/collate_tex.py 00_main_manuscript.tex
python scripts/collate_tex.py 00_SI.tex

mv 00_main_manuscript_collated.tex $final_sub_dir/00_main_manuscript.tex
mv 00_SI_collated.tex $final_sub_dir/00_SI.tex




# #########################################################
#| - Copy Citation Data ###################################
mkdir $final_sub_dir/01_references

cp -r 01_references $final_sub_dir/

rm $final_sub_dir/01_references/ref_lst.xlsx
rm $final_sub_dir/01_references/unused_refs.bib
#__|


# #########################################################
#| - Copy Figures #########################################
cp -r 02_figures $final_sub_dir/
#__|


# #########################################################
#| - Copy Data Tables #####################################
# #########################################################
cp -r 04_data_tables $final_sub_dir/
#__|


# #########################################################
#| - Copy Scripts #########################################
# cp -r scripts $final_sub_dir

mkdir $final_sub_dir/scripts

# cp scripts/00_run_all.sh $final_sub_dir/scripts/

cp scripts/clean_tex_files.sh $final_sub_dir/scripts/
cp scripts/compile_tex.sh $final_sub_dir/scripts/
# cp scripts/create_file_submission_zip.sh $final_sub_dir/scripts/
# cp scripts/dictionaries $final_sub_dir/scripts/
# cp scripts/git_commands.sh $final_sub_dir/scripts/
# cp scripts/python_scripts $final_sub_dir/scripts/
# cp scripts/spell_check.sh $final_sub_dir/scripts/
#__|


# #########################################################
#| - Zip folder ###########################################
# #########################################################
echo $final_sub_dir.zip

zip -r $final_sub_dir.zip $final_sub_dir/
#__|




#| - __old__


# #########################################################
#| -  Copy Section Files ##################################
# #########################################################
# mkdir $final_sub_dir/03_sections
#
# cp -r 03_sections $final_sub_dir/
#
# # rm $final_sub_dir/03_sections/00_abstract.tex
# # rm $final_sub_dir/03_sections/01_introduction.tex
# # rm $final_sub_dir/03_sections/02_00__al_method.tex
# # rm $final_sub_dir/03_sections/02_01__application_to_irox.tex
# # rm $final_sub_dir/03_sections/02_02__struct_motifs.tex
# # rm $final_sub_dir/03_sections/02_03__echem_oer.tex
# # rm $final_sub_dir/03_sections/03_conclusions.tex
# # rm $final_sub_dir/03_sections/04_00_SI.tex
# # rm $final_sub_dir/03_sections/acknowledgements.tex
# rm $final_sub_dir/03_sections/acronyms_vars.md
# # rm $final_sub_dir/03_sections/authors.tex
# # rm $final_sub_dir/03_sections/custom_macros.tex
# # rm $final_sub_dir/03_sections/title.tex
#__|



#__|
