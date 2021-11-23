cd ..

# resize jpeg images
JPEG_PATHS=$(find -type f -name "*.jpeg")
for JPEG_PATH in ${JPEG_PATHS[@]}
do
  # prevent resizing images if they  already have 500px width
  IMAGE_WIDTH=$(identify -format "%w" $JPEG_PATH)
  if [ $IMAGE_WIDTH -ne 500 ]; then
    echo "[JPEG] resizing $JPEG_PATH..."
    convert $JPEG_PATH -resize 500 $JPEG_PATH
  fi
done

# convert png to jpeg and resize
PNG_PATHS=$(find -type f -name "*.png")
for PNG_PATH in ${PNG_PATHS[@]}
do
  # do not convert pngs in icons folder
  if [[ $PNG_PATH != *"/static/icons/"* ]]; then
    JPEG_PATH=${PNG_PATH/.png/.jpeg}
    echo "[PNG] converting $PNG_PATH to jpeg..."
    convert $PNG_PATH -resize 500 $JPEG_PATH
    rm $PNG_PATH
  fi
done

# convert jpg to jpeg ad resize
JPG_PATHS=$(find -type f -name "*.jpg")
for JPG_PATH in ${JPG_PATHS[@]}
do
  JPEG_PATH=${JPG_PATH/.jpg/.jpeg}
  echo "[JPG] converting $JPG_PATH to jpeg..."
  convert $JPG_PATH -resize 500 $JPEG_PATH
  rm $JPG_PATH
done

