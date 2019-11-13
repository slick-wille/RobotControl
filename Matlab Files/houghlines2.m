clear pi r cam; clc;
r = raspi('10.100.114.59','pi','SeniorProject') 
cam = cameraboard(r,'Resolution','1280x720','Quality',100,'Brightness',55,'Contrast', 0,'Saturation',0,'Sharpness',0)
cam.HorizontalFlip = 1; %Flip upside down

savepath = '/Users/kylewille/Documents/MATLAB/Senior_Project/Photos';
nametemplate = 'images_%04d.tif';  %name pattern
imnum=0;
for i = 1:1
    YourImage = snapshot(cam);
    imnum = imnum + 1; %increment name
    thisfile = sprintf(nametemplate, imnum);  %create filename
    fullname = fullfile(savepath, thisfile);  %folder and all
    imwrite( YourImage, fullname);  %write the image there as tif
    %pause(3);
    disp(imnum);
end


I = imread('/Users/kylewille/Documents/MATLAB/Senior_Project/Photos/images_0001.tif');
%rotI = imrotate(I,33,'crop');
%rotI = 
rotI = rgb2gray(I);
BW = edge(rotI,'canny');

[H,T,R] = hough(BW,'RhoResolution', 0.5, 'Theta',[-90:-89 0]);

%imshow(H,[],'XData',T,'YData',R,...
%            'InitialMagnification','fit');
%xlabel('\theta'), ylabel('\rho');
%axis on, axis normal, hold on;

%P  = houghpeaks(H,2,'threshold',ceil(0.3*max(H(:))));
P  = houghpeaks(H,60,'threshold',40); %thresholdMax is 0.5*max(H(:))=241
%smallest odd values greater than or equal to size(H)/50 (default) -->
% -->two-element vector of positive odd integers
x = T(P(:,2)); 
y = R(P(:,1));
%plot(x,y,'s','color','white');

figure, imshow(I), hold on,axis on
lines = houghlines(BW,T,R,P,'FillGap',50,'MinLength',200);


max_len = 0;
for k = 1:length(lines)
   p1 = lines(k).point1;
   p2 = lines(k).point2;
   if p1>1100
       xy = [lines(k).point1; lines(k).point2];
       plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

       % Plot beginnings and ends of lines
       plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
       plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

       % Determine the endpoints of the longest line segment
       len = norm(lines(k).point1 - lines(k).point2);
       if ( len > max_len)
          max_len = len;
          xy_long = xy;
       end
   end
end

plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');

