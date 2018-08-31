function energyImg = energy_img(im)
    Img = im2double(im);
    Img = rgb2gray(Img);
    [dx,dy] = gradient(Img);
    energyImg = sqrt(dx.*dx + dy.*dy);
end
