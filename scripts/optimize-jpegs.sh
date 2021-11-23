cd ..

JPEG_PATHS=$(find -type f -name "*.jpeg")
for JPEG_PATH in ${JPEG_PATHS[@]}
do
  echo "[OPTIMIZE] optimizing $JPEG_PATH..."
  jpegoptim --size=100k --threshold=5 -q $JPEG_PATH
done
