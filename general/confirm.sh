#!/bin/bash

# source https://stackoverflow.com/a/3232082/4054878
# usage: ./confirm.sh && your-command
#    or: ./confirm.sh "Custom message" && your-command

# call with a prompt string or use a default
read -r -p "${1:-Are you sure? [y/N]} " response
case "$response" in
    [yY][eE][sS]|[yY])
        true
        ;;
    *)
        false
        ;;
esac

