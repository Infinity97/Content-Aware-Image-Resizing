im = imread('inputSeamCarvingPrague.jpg');
energyImg = energy_img(im);
[newimg,newreducedimg] = decrease_width(im,energyImg);
for i = 1:99
    [newimg,newreducedimg] = decrease_width(newimg,newreducedimg);
end
subplot(3,1,1);
imshow(im);
title('Original image');
subplot(3,1,2);
imshow(newimg);
title('Seam Carving');
B = imresize(im,[480,540]);
subplot(3,1,3);
imshow(B);
title('Resized image');