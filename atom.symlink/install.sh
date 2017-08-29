#!/bin/sh
if test "$(which apm)"; then
  apm upgrade --confirm false

  modules="
    atom-beautify
    atom-clock
    atom-material-syntax
    atom-wrap-in-tag
    browser-refresh-on-save
    busy-signal
    color-picker
    docker
    editorconfig
    file-icons
    git-plus
    language-diff
    language-docker
    linter
    linter-docker
    linter-ruby
    linter-ui-default
    minimap
    nucleus-dark-ui
    sort-lines
    terminal-plus
    wakatime
  "
  for module in $modules; do
    if test ! -d "$HOME/.atom/packages/$module"; then
      apm install "$module"
    fi
  done

  modules="
    metrics
    exception-reporting
  "
  for module in $modules; do
    if test -d "$HOME/.atom/packages/$module"; then
      apm remove "$module"
    fi
  done
fi
