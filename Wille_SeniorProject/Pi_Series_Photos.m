clear pi r cam; clc;
r = raspi('10.100.114.59','pi','SeniorProject') 
cam = cameraboard(r,'Resolution','1280x720','Quality',100,'Brightness',55,'Contrast', 0,'Saturation',0,'Sharpness',0)
cam.HorizontalFlip = 1; %Flip upside do

%%% -   -   -   -   -   -   -   %%%
%%%     once created it does not need to be created again
%%% -   -   -   -   -   -   -   %%%


savepath = '/Users/kylewille/Documents/MATLAB/Senior_Project/Photos';
nametemplate = 'images_%04d.tif';  %name pattern
imnum=0;
for i = 1:1
    YourImage = snapshot(cam);
    imnum = imnum + 1; %increment name
    thisfile = sprintf(nametemplate, imnum);  %create filename
    fullname = fullfile(savepath, thisfile);  %folder and all
    imwrite( YourImage, fullname);  %write the image there as tif
    pause(3);
    disp(imnum);
end

clear r cam;
