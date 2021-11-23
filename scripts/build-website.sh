#!/bin/bash

./build-blog-list.sh
echo "----- blog list done -----"
./build-memex-list.sh
echo "----- memex list done -----"
./make-jpegs.sh
echo "----- image conversions done -----"
./optimize-jpegs.sh
echo "----- image optimizations done -----"
./build-html.sh
echo "----- HTML files conversions done -----"

cd ..
python3 -m http.server
