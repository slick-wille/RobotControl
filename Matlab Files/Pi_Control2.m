%folder = '/Users/kylewille/Documents/MATLAB/Senior_Project/Photos/test.png';
for i = 1:2
    img = snapshot(cam);
    image(img);
    drawnow;
    %imwrite(img,folder,'PNG')
end
