function [ x_cor,y_cor  ] = Base_Finder(bin)
%% base_finder finds the first ramification place in the panicle from the
% lowest part

%Isolate lowest 25% of bin and 3/5 of total width
low_cropped=bin((round(size(bin,1)*0.75)):size(bin,1),size(bin,2)*1/4:size(bin,2)*3/4);

%%
% get the x coordinate of the lowest part of the stem
for i=1:size(low_cropped,2) % iterate each column
        if low_cropped(size(low_cropped,1),i)==1 % Iterate trough every column of the base (lowest) row
           thresh_part=low_cropped(size(low_cropped,1)-150:size(low_cropped,1),i:i+40);
           tresh_area=sum(thresh_part,'all');
           if tresh_area>5000 % 6000 total number of pixels of the thresh_part (window)
               base=i+25;
               break
           end
        else
        end
    
end
%%
% make array with stem section values (rows)
for i=size(low_cropped,1):-1:1;%
    %"connect" to previous section by pivot
    if i==size(low_cropped,1);
        pivot=base;
    else
        pivot=pivot_regprops;
    end
    
    reg_temp=regionprops(low_cropped(i,:));
    if size(reg_temp,1)==1
    a(1,i)=sum(low_cropped(i,:),'all');  
    a(2,i)=reg_temp.Centroid(1);
    pivot_regprops=reg_temp(1).Centroid(1);
    else
        
        for j=1:size(reg_temp,1)
            if ((reg_temp(j).BoundingBox(1)+reg_temp(j).BoundingBox(3))>pivot)...
                     && (pivot>reg_temp(j).BoundingBox(1))
                 a(1,i)=reg_temp(j).Area;
                 a(2,i)=reg_temp(j).Centroid(1);
                 pivot_regprops=reg_temp(j).Centroid(1);
            else
            end
        end
    end
end
            

%% Find positions - find rate of change
b=0;
for i=size(a,2):-5:1  %% Porque cada 5? 
b=b+1;
if b>5
    if i>20
            if (a(1,i)+2) < a(1,i-5) && (a(1,i-5)+2) < a(1,i-10) && (a(1,i-10)+2)< a(1,i-15)
            
            node = i+100; % ex node
                break
            else
            end
    else
        z=0;
        for t=size(a,2):-5:1
        z=z+1;
        if z>5
        if t>20 && a(1,t)< a(1,t-5) &&  a(1,t-5)< a(1,t-10) &&  a(1,t-10)< a(1,t-15)
            
            node = t+100; % ex node
        else
            node = 1000;
        
        end
        end
        end
        
        
    end
end
end

if (node > size(a(2,:),2))
    node = i;
end
    
y_cor=size(bin,1)-(size(a,2)-node+100); % ex node
x_cor=round(a(2,node))+1000;        

%%


  
   
   
   
   
   
   
   
   
   
   
   
   
   
   
            
            