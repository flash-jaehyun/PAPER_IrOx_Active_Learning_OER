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
#     display_name: Python [conda env:PROJ_irox]
#     language: python
#     name: conda-env-PROJ_irox-py
# ---

# # Import Modules

import os
print(os.getcwd())
import sys

# +
file_to_process = sys.argv[1]

cwd = os.getcwd()
if cwd.split("/")[-1] == "scripts":
    root_dir = "../.."

if ".tex" not in file_to_process:
    file_to_process = "../../diff.tex"
    
if "/" in file_to_process:
    root_dir = "/".join(file_to_process.split("/")[0:-1])
    file_to_process = file_to_process.split("/")[-1]
else:
    root_dir = "."


# -

def read_text_file(file_path):
    with open(file_path, "r") as fle:
        file_lines_list = fle.read().splitlines()

    return(file_lines_list)


lines_to_replace_dict = {

    "{02_figures/03_parity_plot/00_al_perf_plot__\DIFdelbeginFL \DIFdelFL{v1}\DIFdelendFL \DIFaddbeginFL \DIFaddFL{v2}\DIFaddendFL __1200dpi.png}}": "{02_figures/03_parity_plot/00_al_perf_plot__v2__1200dpi.png}}",

    "{02_figures/05_bulk_pourbaix/00_master__bulk-pourbaix__\DIFdelbeginFL \DIFdelFL{v6}\DIFdelendFL \DIFaddbeginFL \DIFaddFL{v7}\DIFaddendFL __1200dpi.png}}": "{02_figures/05_bulk_pourbaix/00_master__bulk-pourbaix__v7__1200dpi.png}}",

    }

# +
diff_file_path = os.path.join(root_dir, file_to_process)
diff_file_lines = read_text_file(diff_file_path)

diff_file_lines_2 = []
for line_i in diff_file_lines:
    
    if line_i in list(lines_to_replace_dict.keys()):
        diff_file_lines_2.append(
            lines_to_replace_dict.get(line_i, "TEMP sijhfijdsw")
            )
    else:
        diff_file_lines_2.append(line_i)

# +
out_path = os.path.join(
    root_dir,
    file_to_process.split(".")[0] + "_processed.tex")

print("Written file path:", "\n", out_path)
with open(out_path, "w") as fle:
    for line in diff_file_lines_2:
        fle.write(line + "\n")
