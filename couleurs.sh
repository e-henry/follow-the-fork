#!/bin/bash

# when $TERM is empty (non-interactive shell), then expand tput with '-T xterm-256color'
[[ ${TERM} == "" ]] && TPUTTERM='-T xterm-256color' \
                  || TPUTTERM=''

declare -r RES=$( tput"${TPUTTERM}" sgr0 ) REV=$( tput"${TPUTTERM}" rev )
declare -r fRD=$( tput"${TPUTTERM}" setaf 1 ) bRD=$( tput"${TPUTTERM}" setab 1 )
declare -r fGN=$( tput"${TPUTTERM}" setaf 2 ) bGN=$( tput"${TPUTTERM}" setab 2 )

echo "${fRD}RED Message: ${REV} This message is RED REVERSE. ${RES}"
echo "${fGN}GREEN Message: ${REV} This message is GREEN REVERSE. ${RES}"
