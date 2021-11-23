---
title: Tiny static site generator
---

# Tiny static site generator

## Requirements:

* bash
* pandoc
* imagemagick
* jpegoptim

### install requirements on ubuntu-based OS

`sudo apt-get install pandoc imagemagick jpegoptim -y`

## How it's done

It's a simple bash script that uses `find` command to locate the files 
in your website and converts/optimize resources, building a ready to 
upload HTML website

## Pandoc

Using this command in a loop, will convert markdown files to html pages.
The `--standalone --template` option is needed if you want to use a custom
template for headers and footers for each html page.

`pandoc --standalone --template template.html $MARKDOWN_PATH -o $HTML_PATH`

## Imagemagick

Using this command in a loop, will convert all png images to jpeg, with
a fixed width of 500px

`convert $PNG_PATH -resize 500 $JPEG_PATH`

Using this command to get image width, if the image width is already 500px,
don't resize, otherwise this will create vertical bands on images over several
resizings

`identify -format "%w" $JPEG_PATH`

Using wildcards, I can convert images avoiding certain folder paths (icons)

`if [[ $PNG_PATH != *"/static/icons/"* ]];`

## jpegoptim

Using this command in a loop, will try to resize jpeg images at 100k,
if the resized image doesn't differ from the original more than 5%
(threshold), just keep the original. `-q` stands for "quiet".

`jpegoptim --size=100k --threshold=5 -q $JPEG_PATH`

## Bonus

Can add in your footer a link to download the page in markdown format.
(internal links will not work, but a workaround can be added, need to think about it)
