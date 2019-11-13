A = imread('/Users/kylewille/Documents/MATLAB/Senior_Project/Photos/image_0001.png');
xWorldLimits = [0 600];
yWorldLimits = [0 300];
RA = imref2d(size(A),xWorldLimits,yWorldLimits)
figure
imshow(A,RA);