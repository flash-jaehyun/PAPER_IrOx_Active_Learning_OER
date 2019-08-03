# In Overleaf:
# 1. Make sure Overleaf changes are pushed to remote master

# #############################################################################

# Locally:
# Make sure all changes are commited or stashed
git stash


git checkout master
git pull origin master

git difftools master raul_master

# Make appropriate changes with text editor

git add --all
git commit -m "My edits to Overleaf master"


# #############################################################################

git checkout king
git merge raul_master
git push

# Check that raul_master and king are identical
# git diff raul_master king


git checkout master
git merge king
git push

# #############################################################################
# In Overleaf:
# Sync changes from Github master
