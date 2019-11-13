%clear
% xT yT zT represent translation, xP yP is pixels from photo
syms r [3]
syms xT yT zT fx fy cx cy xP yP zP
extrinsic=[r1_1,r1_2,r1_3,xT;r2_1,r2_2,r2_3,yT;r3_1,r3_2,r3_3,zT];
intrinsic = cameraParams.IntrinsicMatrix
%intrinsic=[fx,0,cx;0,fy,cy;0,0,1];
zP=1;
res=(intrinsic*extrinsic)*[xP;yP;zP;1];% put zP as 1
X=res(1);
Y=res(2);
Z=res(3);
pretty(res)
disp('X: ');
pretty(X)
disp('Y: ');
pretty(Y)
disp('Z: ');
pretty(Z)

info = imfinfo('PoolPic.jpg')