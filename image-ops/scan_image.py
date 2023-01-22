#!/usr/bin/env python3

# Scans image and converts to a binary PNG
#
# Usage: ./scan_image.py <filename> <threshold>

# Imports
import sys
import cv2

# Displays image until 'q' is pressed.
# title   Image title displayed
# image   NumPy matrix
# Returns   None
def display(title, image):
    cv2.imshow(title, image)
    while True:
        key = cv2.waitKey(1) & 0xFF
        if key == ord('q'):
            break
    cv2.destroyAllWindows()

# ----- Script -----

# Variables
filename = sys.argv[1]
threshold = int(sys.argv[2]) if len(sys.argv) > 2 else 100

# Convert image to binary
image = cv2.imread(filename, 2)
_, bin = cv2.threshold(image, threshold, 255, cv2.THRESH_BINARY)
# display("binary", bin)
cv2.imwrite(filename.split(".")[0] + "_bin.png", bin)
