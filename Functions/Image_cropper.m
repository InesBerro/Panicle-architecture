function [ cropped_img ] = Image_cropper(img)

% img cropper cuts the original image just below the pedicel of the panicle
% img_cropper makes a transitory grayscales img of to find the 
% cutting line.
% The output is in the same format as the input.
  
    gray = im2double(rgb2gray(img));
    % first makes original image to grayscale and then transform class to
    % double precision
    a=find((mean(gray,2))<0.5);
    %%
    tf1=isempty(a);
        if tf1==0
           cropped_img = img(1:a(1)-100,:,:);  
        else     
            gray2=gray(size(gray,1)-round(0.72*(size(gray,1))):size(gray,1),:);   
            a2=find((mean(gray2,2))<0.82);
            tf2=isempty(a2);
                if  tf2==isempty(a2)
                    cropped_img = img(1:round(0.7*(size(gray,1))),:,:); 
                else
                     cropped_img = img(1:a2(1)+round(0.63*(size(gray,1))),:,:);
                end
        end
        %%
 
    %crop the image just above the black line
end
