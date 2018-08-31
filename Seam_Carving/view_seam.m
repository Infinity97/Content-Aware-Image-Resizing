function view_seam(im,seam,seamDirection)
[r,no] = size(seam);
if strcmp(seamDirection,'VERTICAL')
    for i=1:no
        im(i,seam(i),1) = 0;
        im(i,seam(i),2) = 0;
        im(i,seam(i),3) = 0;
    end
else
    for i=1:no
        im(seam(i),i,1) = 0;
        im(seam(i),i,2) = 0;
        im(seam(i),i,3) = 0;
    end
end
imshow(im);
end