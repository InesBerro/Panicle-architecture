% Oats Panicle Analizer

%% SET DIRECTORIES 
% Select the upper level directory where your folders are 

myDir= uigetdir(pwd,'Select the root folder where your images are');

% Select directory where the functions are
myFun=uigetdir(pwd,'Select the folder where your functions are');
% navigate to that directory
cd(myDir)
% make a struct with subfolder names (skip row 1 and 2)
D = dir;

% Set as true  you want to see the cropped img + conv hull 
% only recomended for small number otf images
%% 
%To print each processed panicle with measures
disp_conv = 1;
%%  
% Multiples folder structure: go 1) Masterlist.
% Single folder: go 2)  

%% 1) CREATES A MASTERLIST
j=0;
for i = 1:length(D)
   currD = D(i).name;
   myFiles = dir(fullfile(D(i).name,'*.tif'));
    
    for k=1:length(myFiles);
       j=j+1;
       main(j).path=myFiles(k).folder;
       main(j).name=myFiles(k).name;
    
    end
end
clear currD  i j k myFiles

%% 2) When you don't have multiple directories 
i=0;
for k = 1:length(D)
    i=i+1;
    main(i).path = D(k).folder;
    main(i).name = D(k).name;
    
end
clear  i k D
%% 
% To convert table to cell array

main=(table2cell(struct2table(main)));

cd(myFun);

for i= 3:length(main)
  
    Filename = char(main(i,2)); % get image name
    fullFilename = fullfile(char(main(i,1)),Filename); % get full path
   
    % [img] = imread(fullFilename); % read image
    main_results(i).filename=char(main(i,2));
    main_results(i).folder=char(main(i,1));
    main_results(i).datetime=char(datetime('now'));
    
    cropped=Image_cropper(img); % crop
   
    bin=make_binary(cropped); % make binary
    [x_cor,y_cor]=Base_Finder(bin); % to define the first node
    [compactness,p_lenght,p_width]=compact_(bin,y_cor); %to calculate campactness, panicle length and width
   
    main_results(i).compactness=compactness;
    main_results(i).panicle_length_cm=(p_lenght*0.0042);
    main_results(i).panicle_width_cm=(p_width*0.0042);   
    
    %DB=sum(bin,'all'): 
    DB=dig_biomass(bin);
    main_results(i).DB_cm2=dig_biomass(bin)*1.7640e-05;
     
 % panicle plot
 if disp_conv == 1
     
        [y, x] = find(bin(1:y_cor,:));
        k = convhull(x,y); 
        imshow(bin);
        hold on;
        plot(x(k),y(k),'r','LineWidth',3);
       
        img_name=char(main(i,2));
        DB=num2str(main_results(i).DB_cm2);
        Comp=num2str(main_results(i).compactness);
        P_lenght=num2str(main_results(i).panicle_length_cm);
        P_width=num2str(main_results(i).panicle_width_cm);
     
        text(300,300,img_name,'color','r','Interpreter','none');
        text(300,700,'DB_cm2','color','r','Interpreter','none');
        text(1300,700,DB,'color','r','Interpreter','none');
        text(300,900,'Comp','color','r','Interpreter','none');
        text(1200,900,Comp,'color','r','Interpreter','none');
        text(300,1100,'P_lenght','color','r','Interpreter','none');
        text(1200,1100,P_lenght,'color','r','Interpreter','none')
        text(300,1300,'P_width','color','r','Interpreter','none');
        text(1200,1300,P_width,'color','r','Interpreter','none')
              
        pause(1);
        hold off;
 end
      
  
  clear bin cropped DB i img x_cor y_cor compactness  img_iter p_lenght...
      p_width panicle_area panicle_lenght panicle_width DB Comp P_lengh P_width
       
       
end
%%

writetable(struct2table(main_results),'panicle_Results.csv','Delimiter',',');
%%