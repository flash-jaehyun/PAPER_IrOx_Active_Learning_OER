# Machine Learning IrOx OER Paper
---

## Links:

### Paper
Paper Github Repo:
https://github.com/raulf2012/PAPER_IrOx_Active_Learning_OER

Paper Dropbox Folder:
https://www.dropbox.com/sh/02d6ysvy6o2pgsb/AABtNQCE5PXXNL2nP1c0MHz1a?dl=0

### Public Data Upload
CatHub:
https://www.catalysis-hub.org/publications/FloresActive2020

MPContribs:
https://portal.mpcontribs.org/active_learned_irox_polymorphs/

### Project scripts/analysis

Project Analysis Github Repo:
https://github.com/raulf2012/PROJ_IrOx_Active_Learning_OER

Corresponding Dropbox location:
https://www.dropbox.com/sh/ulvd8mnl52p6bu8/AAAMKH95XtwLex7S3jg1z6T5a?dl=0

### Location of figure files
https://www.dropbox.com/sh/77hz3rvjtpa3k6b/AAA3y0-m69bxQHD8Za2FpTxLa?dl=0

### Manuscript Feedback Notes:

https://www.dropbox.com/sh/w3g4lojpxownz5a/AACczNfQGUqsWnmzIHgG1a2Ja?dl=0

### Workflowy:

https://workflowy.com/s/ml-irox-oer-publicat/kA13CTQkFbAzFkBd

Latex table generation: https://www.tablesgenerator.com/latex_tables

---

## TODO List:
  * Change name of algorithm to ALA and change references in text to this
  * Be consistent about use of 'fingerprint' vs 'feature', just use 1
  * Give tables in SI that have more sig figs than numbers in text/plots
    * Or just make sure that the attached data (zip file or something) has the info available
  * Change ALL to something else (AL would be fine, maybe something more fancy)

## Notes:

I used the `git update-index --skip-worktree *pdf` on the output pdf file to ignore changes
See the following link:
https://stackoverflow.com/questions/6138076/git-assume-unchanged-vs-skip-worktree-ignoring-a-symbolic-link

### Use latexdiff to create pdf document that shows changes
latexdiff $gr/PAPER_IrOx_Active_Learning_OER-2.0/PAPER_IrOx_Active_Learning_OER-2_collated.tex 00_main_manuscript_collated.tex > diff.tex

### Steps to create the pdf diff files that show changes since submission

Collating the v2.0 main text and SI tex documents to one file. The script also replaces all custom macro instances with literal text.

`python scripts/collate_tex.py $gr/PAPER_IrOx_Active_Learning_OER-2.0/PAPER_IrOx_Active_Learning_OER-2.0/00_main_manuscript.tex`

`python scripts/collate_tex.py $gr/PAPER_IrOx_Active_Learning_OER-2.0/PAPER_IrOx_Active_Learning_OER-2.0/00_SI.tex`

Do the same thing with the most up to date version

`python scripts/collate_tex.py 00_main_manuscript.tex`

`python scripts/collate_tex.py 00_SI.tex`

Now create the diff `.tex` files that highlight changes

`bash scripts/create_latex_diff.sh`

The generated diff files need to be processed a bit more, because `latexdiff` replaces path lines for figure generation.

`python scripts/git_scripts/process_diff.py diff_main_manuscript.tex`

`python scripts/git_scripts/process_diff.py diff_SI.tex `

Now run the normal compilation script, needed to create proper tex data files.

`./scripts/compile_tex.sh separate_full`

Compiling diff latex files for main manuscript and SI

`./scripts/compile_tex.sh diff_main_manuscript_processed full`

`./scripts/compile_tex.sh diff_SI_processed full`


### Code-folding syntax
I use a custom syntax to fold code through out this repo (% | - CF start) and (% \_\_|).
I find this quite useful for navigation, and to achieve the same effect in your VIM editor put the following code into your `~/vimrc`:

`setlocal foldmethod=marker foldmarker=#\|\ -,#__\|`



## Paper Tags:
  `#REF`
  `#TODO`
  `##COMBAK`

## Final Pre-submission Checklist
1. Make sure that all acronyms are defined before they are used
2. Make sure all references are placed correctly
3. Define Gaussian Process (GP) in text
4. Consistent formatting of V vs. RHE (with dot at vs.)
5. ab-initio is formatted properly (italicized)

## Git commands
---
Workflow (Just for @Raul)

1. From `Overleaf.com`: Sync changes in Overleaf to Github
  - Menu --> Github --> Push Overleaf changes to Github
2. From local repo:
  - Make sure all local changs are pushed to `raul_master`
3. From Github: Merge `raul_master` into `master`
4. From Github: Merge `master` into `king`
5. From Github: Merge `king` into `master` (NECESSARY?)
6. From `Overleaf.com`: Sync changes down from Github
