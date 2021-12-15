function [compact,pan_len, pan_wid] = compact_(bin,y_cor)
% Compactness is the panicle area divided by the area contained within a
% convex hull around the panicle
% Remove pedicel of panicle
ch_bin=bin(1:y_cor,:);
%Area of panicle & convhull
area_panicle=sum(ch_bin,'all');
ch_bin = bwconvhull(ch_bin);
ch_bin_area=sum(ch_bin,'all');
% Area of panicle
compact = area_panicle/ch_bin_area ;
%Tassel lenght
stats=regionprops(ch_bin);
pan_len=stats.BoundingBox(4);
pan_wid=stats.BoundingBox(3);

    
end 