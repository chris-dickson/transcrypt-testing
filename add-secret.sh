#!/bin/bash
echo "$1  filter=crypt diff=crypt merge=crypt" >> .gitattributes
git add .gitattributes $1