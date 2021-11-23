#!/bin/bash

echo "[MEMEX] rebuilding memex links..."

rm ../docs/memex/index.md
echo -e "
---
title: Memex
---

# Memex

## Origins

memex (memory expansion) is the name of the hypothetical
electromechanical device that [Vannevar Bush](https://en.wikipedia.org/wiki/Memex?oldformat=true) described
in his 1945 article ["As we may think"](https://www.theatlantic.com/magazine/archive/1945/07/as-we-may-think/303881/).

>“Consider a future device in which an individual
>stores all his books, records, and communications,
>and which is mechanized so that it may be consulted
>with exceeding speed and flexibility.
>It is an enlarged intimate supplement to his memory.”

The concept of the memex influenced the developement
of early hypertext systems and personal knowledge base systems.

## My version of memex

There is not a standard way to build a memex, let's say that
it's like a way to keep track of your ideas and watch them grow
every time you edit them, while keeping the writing process simple.

I'm basing my memex on markdown notes that gets rendered to html via
a simple script. 

## Notes & Ideas

" >> ../docs/memex/index.md

DIRS=$(find ../docs/memex/ -maxdepth 1 -type d -printf '%P\n' | sort -nr)
for DIR in ${DIRS[@]}
do
  SPLITTED_NAME=${DIR//-/ }
  echo "* [$SPLITTED_NAME](./$DIR)" >> ../docs/memex/index.md
  echo "[MEMEX] added '$SPLITTED_NAME'"
done
