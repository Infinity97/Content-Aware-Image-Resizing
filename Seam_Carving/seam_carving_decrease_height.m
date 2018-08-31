im = imread('inputSeamCarvingPrague.jpg');
energyImg = energy_img(im);
[newimg,newreducedimg] = decrease_height(im,energyImg);
for i = 1:49
    [newimg,newreducedimg] = decrease_height(newimg,newreducedimg);
end
subplot(1,3,1);
imshow(im);
title('Original image');
subplot(1,3,2);
imshow(newimg);
title('Seam Carving');
B = imresize(im,[430,640]);
subplot(1,3,3);
imshow(B);
title('Resized image');