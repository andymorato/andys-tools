#!/usr/bin/env python3

# Splits file by symbol onto new lines
#
# Usage: ./split_by_symbol.py <filename> <split_symbol>

# Imports
import sys

# Variables
filename = sys.argv[1]
symbol = sys.argv[2]

# Read file
file = open(filename, 'r')
lines = file.readlines()

# Replace split sybmols with newlines
newlines = []
for line in lines:
    newlines += line.split(symbol)

# Write lines back to the file
file = open(filename, "w")
for line in newlines:
    file.write(line + "\n")
file.close()
