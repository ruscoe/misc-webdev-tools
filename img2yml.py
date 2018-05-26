#! /usr/bin/env python

"""Takes a directory of image files and outputs file names and dimensions in YML format."""

from os import listdir
import argparse

# Requires Python Imaging Library - https://pypi.org/project/PIL/
import Image

parser = argparse.ArgumentParser()

parser.add_argument("-p", "--path", type=str, required=True, help="the path to the image files")

args = parser.parse_args()

output = ''

files = listdir(args.path)
for filename in files:
    # Load image file.
    pil = Image.open(args.path + '/' + filename).convert('L')
    width, height = pil.size

    imagedata = [filename, width, height]

    # Build YML output.
    output += '- filename: ' + filename + '\n'
    output += '\twidth: ' + str(width) + '\n'
    output += '\theight: ' + str(height) + '\n'

# Print YML output.
print output
