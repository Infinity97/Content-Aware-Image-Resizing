im = imread('inputSeamCarvingPrague.jpg');
energyImg = energy_img(im);
im = im2double(im);
[newimg,newreducedimg] = increase_width(im,energyImg);
for i = 1:49
    [newimg,newreducedimg] = increase_width(newimg,newreducedimg);
end
subplot(2,1,1);
imshow(im);
title('Original image');
subplot(2,1,2);
imshow(newimg);
title('Seam Carving');
B = imresize(im,[430,640]);

