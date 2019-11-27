#!/usr/bin/env python

"""Print out occurences of certain words in latex files

Author(s): Raul A. Flores
"""

#| - IMPORT MODULES
import os
import sys
#__|

# | - Script Inputs
count_comments = True  # whether to count WORD in comments or not

words_to_check = [
    "TEMP",
    "COMBAK",
    "TODO",
    "XYZ",
    # "",
    ]
# __|


root_dir = os.path.join(os.environ["PROJ_irox_paper"])
for subdir, dirs, files in os.walk(root_dir):

    #| - Skip certain directories
    if "/.git" in subdir:
        continue
    if "/__misc__" in subdir:
        continue
    # __|

    for file in files:
        if ".tex" in file:
            print(80 * "*")
            print(file)
            print(80 * "*"); print("\n")

            with open(os.path.join(subdir, file), "r") as fle:
                lines = fle.readlines()
                lines = [line.strip() for line in lines]

                for line in lines:
                    # | - Checking if line is comment
                    if "%" in line:
                        ind_of_comm_char = line.find("%")
                        line_no_comm = line[:ind_of_comm_char]

                        if count_comments:
                            line = line
                        else:
                            line = line_no_comm
                    else:
                        pass
                    # __|

                    for word in words_to_check:
                        if word in line:
                            print(word, "|", line); print("-")

                    # if "TEMP" in line:
                    #     print(line); print("-")
