# Shell scripts

## Couleurs

Couleur dispo : 

```
for code ({000..255}) print -P -- "%F{$code}$code: Couleur : \uf445\uf445\uf445"
```

## Tests

- `-z $variable` renvoie vrai si une variable n'est pas instanciée ou vide
- `-f $fichier` renvoie vrai si un fichier existe
- `-d $repertoire` renvoie vrai si un répertoire existe

## valeurs par défaut

    readonly my_var=${1:-"val par défaut"}

## expensions

    rm -rf empty[A-H]*
    rm -rf empty[I-Z]*


## Script d'exemple

```
#!/usr/bin/env bash

#This variable won't be modifiable after affectation : 
readonly non_modifiable_variable="Hello World"

set -euo pipefail
#IFS=$' \n\t'

# Colors to use to colorize strings to print
if [ -n "$TERM" ]; then
  # Colors to use to colorize strings to print
  red=$(tput setaf 1)
  yellow=$(tput setaf 3)
  green=$(tput setaf 2)
  bold=$(tput bold)
  standard=$(tput setaf 6)
  normal=$(tput sgr0)
fi

say() {
  echo "$bold$standard$*$normal"
}

error() {
  echo "$bold$red$*$normal"
}

success() {
  echo "$bold$green$*$normal"
}

warning() {
  echo "$bold$yellow$*$normal"
}

usage() {
  echo "This script will do something nice"
  echo "Usage : $(basename "${0}") <arg1>"
  echo "   <arg1> : The first argument"
  echo ""
}

if [ $# != 1 ]; then
  usage
  exit 1
fi

## This is the syntax to have a default argument to a script
readonly my_var=${1:-"You did not provide an argument"}

echo "${bold}This is the content of 'non_modifiable_variable' ${standard}: $non_modifiable_variable"

echo "${bold}This is the content of the first argument ${standard}: $1"

echo "${bold}This is the content of my_var ${standard}: $my_var"
# Replace 'v_i_m' by 'vim' bellow
#v_i_m: ai:ts=2:sw=2:ft=bash
#v_i_m: set expandtab:
```
## Autre gestion des Couleurs

```
#!/bin/bash

# when $TERM is empty (non-interactive shell), then expand tput with '-T xterm-256color'
[[ ${TERM} == "" ]] && TPUTTERM='-T xterm-256color' \
                  || TPUTTERM=''

declare -r RES=$( tput"${TPUTTERM}" sgr0 ) REV=$( tput"${TPUTTERM}" rev )
declare -r fRD=$( tput"${TPUTTERM}" setaf 1 ) bRD=$( tput"${TPUTTERM}" setab 1 )
declare -r fGN=$( tput"${TPUTTERM}" setaf 2 ) bGN=$( tput"${TPUTTERM}" setab 2 )

echo "${fRD}RED Message: ${REV} This message is RED REVERSE. ${RES}"
echo "${fGN}GREEN Message: ${REV} This message is GREEN REVERSE. ${RES}"
```
