#!/usr/bin/env python3
filename = 'sample_req'

file1 = open(filename, 'r')
Lines = file1.readlines()

str = ''
for line in Lines:
    i = 0
    while i < len(line) and line[i] >= '0' and line[i] <= '9':
        line = line[1:]
    str += line

text_file = open(filename, "w")
text_file.write(str)
text_file.close()
