# Panicle-architecture

---------

This repository contains all the function to analyze panicle images and extract panicle features in MATLAB software.

The Panicle_functions folder contains five functions for analyzing panicle images
`Panicle_Analyzer.m`: To execute the entire pipeline.
`Image_cropped.m`: to crop the image and keep the parser part
`make_binary.m`: to transform the image into a binary matrix  (0 and 1).
`base_Finder.m`: to find the first panicle node.
`compact_.m`: to calculate the compactness, length, and width of the panicle.

Inputs

Functions were written to process panicle images that have a black line who separate the panicle and the images information (** example)
