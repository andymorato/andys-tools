#!/usr/bin/env python3

# Removes leading numbers from the given file
#
# Usage: ./removeLeadingNums.py <filename>

# Imports
import sys

# Variables
filename = sys.argv[1]

# Read file
file = open(filename, 'r')
Lines = file1.readlines()

# Strip leading numbers from each line
str = ''
for line in Lines:
    i = 0
    while i < len(line) and line[i] >= '0' and line[i] <= '9':
        line = line[1:]
    str += line

# Write lines back to the file
file = open(filename, "w")
file.write(str)
file.close()
