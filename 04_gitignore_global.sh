git config --global core.excludesfile "~/.gitignore_global"
cat <<EXCL >> ~/.gitignore_global
# Direnv stuff
.direnv
.envrc
# Editor files #
*~
*.swp
*.swo
EXCL
