#! /usr/bin/env python

"""Takes a directory of files and outputs HTML link elements for each."""

from os import listdir
import argparse

parser = argparse.ArgumentParser()

parser.add_argument("-p", "--path", type=str, required=True, help="the path to the files")
parser.add_argument("-f", "--prefix", type=str, required=False, help="optional prefix to file links", default="")

args = parser.parse_args()

output = '<html>\n'
output += '<ul>\n'

files = listdir(args.path)
for filename in files:
    # Build HTML output.
    output += '<li><a href="' + args.prefix + filename + '">' + filename + '</a></li>\n'

output += '</ul>\n'
output += '</html>\n'

# Print HTML output.
print (output)
