#!/usr/bin/env bash

#This variable won't be modifiable after affectation :
readonly non_modifiable_variable="Hello World"

set -euo pipefail
#IFS=$' \n\t'

# Colors to use to colorize strings to print
STANDARD=$(tput setaf 6)
RED=$(tput setaf 1)
YELLOW=$(tput setaf 3)
GREEN=$(tput setaf 2)
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

usage() {
  echo "This script will do something nice"
  echo "Usage : $(basename "${0}") <arg1>"
  echo "   <arg1> : The first argument"
  echo ""
}

say() {
  echo "$BOLD$STANDARD$*$NORMAL"
}

error() {
  echo "$BOLD$RED$*$NORMAL"
}

success() {
  echo "$BOLD$GREEN$*$NORMAL"
}

warning() {
  echo "$BOLD$YELLOW$*$NORMAL"
}
if [ $# != 1 ]; then
  usage
  exit 1
fi

## This is the syntax to have a default argument to a script
readonly my_var=${1:-"You did not provide an argument"}

echo "${STANDARD}This is the content of 'non_modifiable_variable' ${NORMAL}: $non_modifiable_variable"

echo "${STANDARD}This is the content of the first argument ${NORMAL}: $1"

echo "${STANDARD}This is the content of my_var ${NORMAL}: $my_var"

say il va y avoir une erreur : 
error La voici
warning Attention !
success Mais tout est OK
