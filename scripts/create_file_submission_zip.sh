# Creating final .zip directory of all needed .tex files for submission


final_sub_dir=active_learned_irox_polymorphs



mkdir $final_sub_dir

cp 00_main_manuscript.tex $final_sub_dir/


# #########################################################
# Copy Citation Data ######################################
# #########################################################

mkdir $final_sub_dir/01_references

cp 01_references/global_opt_refs.bib $final_sub_dir/01_references/
cp 01_references/irox_refs.bib $final_sub_dir/01_references/
cp 01_references/misc_refs.bib $final_sub_dir/01_references/
cp 01_references/ml_refs.bib $final_sub_dir/01_references/
cp 01_references/oer_refs.bib $final_sub_dir/01_references/
# cp 01_references/ref_lst.xlsx $final_sub_dir/01_references/
cp 01_references/software_refs.bib $final_sub_dir/01_references/
# cp 01_references/unused_refs.bib $final_sub_dir/01_references/


# #########################################################
# Copy Figures ###########################################
# #########################################################
cp -r 02_figures $final_sub_dir/


# #########################################################
# Copy Section Files ######################################
# #########################################################
mkdir $final_sub_dir/03_sections

cp 03_sections/00_abstract.tex $final_sub_dir/03_sections/
# cp 03_sections/00_abstract_plain_text.tex $final_sub_dir/03_sections/
cp 03_sections/01_introduction.tex $final_sub_dir/03_sections/
cp 03_sections/02_00__al_method.tex $final_sub_dir/03_sections/
cp 03_sections/02_01__application_to_irox.tex $final_sub_dir/03_sections/
cp 03_sections/02_02__struct_motifs.tex $final_sub_dir/03_sections/
cp 03_sections/02_03__echem_oer.tex $final_sub_dir/03_sections/
cp 03_sections/03_conclusions.tex $final_sub_dir/03_sections/
cp 03_sections/04_00_SI.tex $final_sub_dir/03_sections/
cp 03_sections/acknowledgements.tex $final_sub_dir/03_sections/
# cp 03_sections/acronyms_vars.md $final_sub_dir/03_sections/
cp 03_sections/authors.tex $final_sub_dir/03_sections/
cp 03_sections/custom_macros.tex $final_sub_dir/03_sections/
# cp 03_sections/__old__ $final_sub_dir/03_sections/


# #########################################################
# Copy Data Tables ########################################
# #########################################################
cp -r 04_data_tables $final_sub_dir/


# #########################################################
# Copy Data Tables ########################################
# #########################################################
# cp -r scripts $final_sub_dir

mkdir $final_sub_dir/scripts

cp scripts/00_run_all.sh $final_sub_dir/scripts/
cp scripts/clean_tex_files.sh $final_sub_dir/scripts/
cp scripts/compile_tex.sh $final_sub_dir/scripts/
# cp scripts/create_file_submission_zip.sh $final_sub_dir/scripts/
# cp scripts/dictionaries $final_sub_dir/scripts/
# cp scripts/git_commands.sh $final_sub_dir/scripts/
# cp scripts/python_scripts $final_sub_dir/scripts/
# cp scripts/spell_check.sh $final_sub_dir/scripts/


# #########################################################
# Zip folder ##############################################
# #########################################################
echo $final_sub_dir.zip

zip -r $final_sub_dir.zip $final_sub_dir/
