cd ..

MARKDOWN_PATHS=$(find -type f -name "*.md")
for MARKDOWN_PATH in ${MARKDOWN_PATHS[@]}
do
  HTML_PATH=${MARKDOWN_PATH/.md/.html}
  echo "[HTML] building $HTML_PATH"
  pandoc --standalone --template template.html $MARKDOWN_PATH -o $HTML_PATH
done
