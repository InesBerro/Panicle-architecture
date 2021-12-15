# Panicle architecture project

---------

This repository contains all the functions to analyze panicle images and extract panicle traits in MATLAB software.

The Panicle_function folder contains five functions for analyzing panicle images
- `Panicle_Analyzer.m`: to execute the entire pipeline.
- `Image_cropped.m`: crop the image and keep the panicle part, removing QR-code and scale reference.
- `make_binary.m`: to transform the image into a binary matrix  (0 and 1).
- `base_Finder.m`: to find the panicle lower (or first) node.
 - `compact_.m`:  to calculate compactness,  panicle length, and width.

Panicle_images folder contains an image as an example.

### Inputs

Functions were written to process panicle images that contain a black line that separates the panicle and the images information(QR-code and scale reference). All the functions consider the image size proportions. The example image is a 7000 by 5300 pixels size image. Cropped and binary images are 5124 by 5100 pixels.

Panicle analyzer asked to indicate the images and functions directories. 

### Output

A CSV file is saved in the working directory with the five traits values.

`Panicle_Analyzer.m` allows printing a figure with the binary image, the convex hull, and panicle's traits values.
