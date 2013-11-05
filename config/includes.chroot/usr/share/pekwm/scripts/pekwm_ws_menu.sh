#!/bin/bash
#
# Copyright © 2009 the pekwm development team
#

if test "${1}" = "send"; then
  action="SendToWorkspace"
elif test "${1}" = "goto"; then
  action="GotoWorkspace"
else
  echo "usage: $0 goto|send dynamic"
  exit 1
fi

if test "${2}" = "dynamic"; then
  echo "Dynamic {"
fi

num_workspaces="$(xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{ print $3 }')"

i=1;
while test "${i}" -le "${num_workspaces}"; do
  echo "Entry = \"Workspace $i\" { Actions = \"${action} ${i}\" }"

  i=$(($i + 1))
done


if test "${2}" = "dynamic"; then
  echo "}"
fi
