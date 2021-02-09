#!/usr/bin/bash

# 2021-01-30 K.Heidenborg.se / www.github.com/Liegia
# This script requires noed to be installed.

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
# Extension to be installed
npm install coc-python coc-tsserver coc-html coc-css coc-json coc-yaml coc-fzf-preview coc-git coc-markdownlint coc-prettier coc-pyright coc-vimlsp coc-yaml coc-yank coc-marketplace --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

