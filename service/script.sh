#!/bin/bash

FILES="/text/*.md"
for file in $FILES; do
  if [ -f "$file" ]
  then
    pandoc "$file" --pdf-engine=xelatex -V mainfont="CMU Serif" -V monofont="CMU Typewriter Text" --toc --toc-depth=2 --citeproc --bibliography="${file%.md}.json" -o отчёт.pdf
  else 
    echo "Warning: Some problem with \"$file\""
  fi
done