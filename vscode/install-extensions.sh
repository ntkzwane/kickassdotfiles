#!/bin/zsh
# skip the first line in extensions (it's just a comment)
tail -n +2 extensions | xargs -L 1 code --install-extension
