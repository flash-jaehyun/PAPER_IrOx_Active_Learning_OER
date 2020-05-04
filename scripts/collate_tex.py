# ---
# jupyter:
#   jupytext:
#     formats: ipynb,py:light
#     text_representation:
#       extension: .py
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.3.2
#   kernelspec:
#     display_name: Python [conda env:PROJ_IrOx_Active_Learning_OER]
#     language: python
#     name: conda-env-PROJ_IrOx_Active_Learning_OER-py
# ---

# # Import Modules

import os
print(os.getcwd())
import sys

# # Script Inputs

# +
# root_dir = "./03_sections"
# root_dir = "temp_paper_files"

root_dir = "."
# root_dir = ".."

# file_to_process = "00_main_manuscript.tex"

file_to_process = sys.argv[1]


# -

# # Methods

def read_text_file(file_path):
    with open(file_path, "r") as fle:
        file_lines_list = fle.read().splitlines()

    return(file_lines_list)


# # Collate all tex files into one

# +
main_manu_path = os.path.join(root_dir, file_to_process)
# main_manu_path = os.path.join(file_to_process)
main_manu_list = read_text_file(main_manu_path)

# #########################################################
in_SI_section = False

composite_tex_lines_list = []
for line_i in main_manu_list:

    if "main" in file_to_process:
        if "% | - Supporting Information" in line_i:
            in_SI_section = True
        if in_SI_section and "% __|" in line_i:
            # if "% __|" in line_i:
            in_SI_section = False


    if not in_SI_section:
        if "\input{" in line_i and line_i[0] != "%":
            # #################################################
            file_to_drop_in_path = line_i.split("{")[-1].split("}")[0]
            file_to_drop_in_path = file_to_drop_in_path + ".tex"
            file_to_drop_in_path = os.path.join(root_dir, file_to_drop_in_path)
            # file_to_drop_in_path = os.path.join(file_to_drop_in_path)

            file_lines_list_i = read_text_file(file_to_drop_in_path)

            for line_j in file_lines_list_i:
                composite_tex_lines_list.append(line_j)

            tmp = line_i
        else:
            composite_tex_lines_list.append(line_i)
# -

# # Write new collated file to disk

out_path = os.path.join(
    root_dir,
    file_to_process.split(".")[0] + "_collated.tex")
with open(out_path, "w") as fle:
    for line in composite_tex_lines_list:
        fle.write(line + "\n")
