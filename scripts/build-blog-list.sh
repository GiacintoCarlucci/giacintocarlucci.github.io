#!/bin/bash

echo "[BLOG] rebuilding blog articles list..."

rm ../docs/blog/index.md

echo -e "
---
title : Blog
---
" >> ../docs/blog/index.md

DIRS=$(find ../docs/blog/ -maxdepth 1 -type d -printf '%P\n' | sort -nr)
for DIR in ${DIRS[@]}
do
  SPLITTED_NAME=(${DIR//_/ })
  DATE=${SPLITTED_NAME[0]//-//}
  TITLE=${SPLITTED_NAME[1]//-/ }
  echo "* $DATE - [$TITLE](./$DIR)" >> ../docs/blog/index.md
  echo "[BLOG] added '$TITLE'"
done
