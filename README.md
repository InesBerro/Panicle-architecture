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

### Functions and traits 

Custom MATLAB (R2020a) scrips were developed to measure and evaluate image panicle architecture properties. A pipeline was created to crop images at the reference line (`Image_cropped.m`), binarize the images, and remove their background (`make_binary.m`). 

Panicle traits were obtained in pixels and scaled to metric units. 
- Digital biomass (cm2) was calculated as the pixel area of the panicle expressed in cm2.
- Compactness was calculated as the ratio between the pixel area of the panicle and the total area enclosed by the convex hull around the panicle. 
-Panicle length (cm) was calculated as the distance between the first node and the highest point of the panicle, defined based on the boundary box or smallest rectangle that involves the total of the panicle touching the extreme points.
- Panicle width (cm) was calculated as the distance between the two extreme points at the sides of the panicle defended based on the boundary box. 

### Output
A CSV file is saved in the working directory with the five traits values.

`Panicle_Analyzer.m` allows printing a figure with the binary image, the convex hull, and panicle's traits values.
