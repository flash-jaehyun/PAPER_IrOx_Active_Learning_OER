# ---
# jupyter:
#   jupytext:
#     formats: ipynb,py:light
#     text_representation:
#       extension: .py
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.4.2
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
exclude_SI = True

replace_macros = True

# +
file_to_process = sys.argv[1]

cwd = os.getcwd()
if cwd.split("/")[-1] == "scripts":
    root_dir = ".."

if ".tex" not in file_to_process:
    file_to_process = "../00_main_manuscript.tex"
    
if "/" in file_to_process:
    root_dir = "/".join(file_to_process.split("/")[0:-1])
    file_to_process = file_to_process.split("/")[-1]
else:
    root_dir = "."


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
found_end_of_SI_section = False

composite_tex_lines_list = []
for i_cnt, line_i in enumerate(main_manu_list):

    if "main" in file_to_process:
        if exclude_SI:
            if "% | - Supporting Information" in line_i:
                in_SI_section = True
            if in_SI_section and "% __|" in line_i:
                # if "% __|" in line_i:
                # in_SI_section = False
                found_end_of_SI_section = True
                print("Found end of SI section")
                print(i_cnt)
                # i_cnt_SI = i_cnt
                
                i_cnt_not_in_SI = i_cnt + 1

            if found_end_of_SI_section:
                if i_cnt <= i_cnt_not_in_SI:
                    in_SI_section = True
                else:
                    in_SI_section = False

    # if not in_SI_section and i_cnt > i_cnt_SI:
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

# # Replacing Macros

# +
macros_file_path = os.path.join(
    root_dir,
    "03_sections/custom_macros.tex")

macro_replace_dict = dict()
macros_lines_list = read_text_file(macros_file_path)
for line_i in macros_lines_list:

    if "\\def" in line_i:
        str_to_replace = line_i.split(" ")[1]
        replace_str = line_i.split(" ")[-1].replace("\\xspace", "")[1:][:-1]

        macro_replace_dict[str_to_replace] = replace_str

# line_i = '\\def \\ABtwo {AB\\textsubscript{2}\\xspace}'


macro_replace_dict_new = dict()
for key, val in macro_replace_dict.items():
    
    new_key = key + "{}"
    macro_replace_dict_new[key] = val
    macro_replace_dict_new[new_key] = val

    # macro_replace_dict_new
    # line_i = "The calculated OER activities of relevant OER stable surfaces are plotted against the \DGOmOH{} descriptor and are shown in Figure \ref{fig:oer_volcano}b."

# +
# composite_tex_lines_list = [    
#     "Oxygen saturated IrO\textsubscript{3} systems thus bind OER intermediates more weakly, which leads to positive shift in \DGOmOH{}.",
#     ]

# + jupyter={"outputs_hidden": true}
composite_tex_lines_list_2 = []
for line_i in composite_tex_lines_list:

    if "\\def " not in line_i:
        for key, val in macro_replace_dict_new.items():
            if key in line_i:
                # line_i = line_i.replace(key, val)

                for word_j in line_i.split(" "):
                    # print(word_j)
                    if len(word_j) > 0 and word_j[-1] == ".":
                        word_j = word_j[:-1]

                    for key, val in macro_replace_dict_new.items():
                        if word_j == key:
                            # macro_replace_dict_new[key]
                            line_i = line_i.replace(key, val)

        composite_tex_lines_list_2.append(line_i)

    else:
        composite_tex_lines_list_2.append(line_i)

# +
# tmp = [print(i) for i in composite_tex_lines_list_2]
# -

# # Write new collated file to disk

# +
out_path = os.path.join(
    root_dir,
    file_to_process.split(".")[0] + "_collated.tex")

if replace_macros:
    composite_tex_lines_list = composite_tex_lines_list_2

print("Written file path:", "\n", out_path)
with open(out_path, "w") as fle:
    for line in composite_tex_lines_list:
        fle.write(line + "\n")
