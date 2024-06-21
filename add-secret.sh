#!/bin/bash
if [ "$1" == ".gitattributes" ]; then
  echo "You can't add .gitattributes to itself"
  exit 1
fi

echo "$1  filter=crypt diff=crypt merge=crypt" >> .gitattributes
git add .gitattributes $1