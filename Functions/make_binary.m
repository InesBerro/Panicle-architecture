function [ bin, thresh] = make_binary(cropped_img)

% make_binary binarizes the cropped panicle image and remove all except the
% largest single object from the image

gray = im2double(rgb2gray(cropped_img));
% makes a grayscale image and then change format to double precision
thresh = graythresh(gray);
% calculates treshold to binarize
bin = gray > thresh;
% binarize grayscale image
bin = imcomplement(bin);
% flip 0 <-> 1
Labels = bwlabel(logical(bin));
% Label independent components
Regs = regionprops(logical(bin));
% determine area of independent components
keep = find([Regs.Area] == max([Regs.Area]));
% find index of component with max area (panicle)
bin(Labels ~= keep) = 0;
% makes everithing but the largest component black
end

