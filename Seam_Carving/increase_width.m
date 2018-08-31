function [increasedColorImg,increasedEnergyImg] = increase_width(im,energyImg)
    cumulativeEnergyMap = cumulative_min_energy_map(energyImg,'VERTICAL');
     verticalSeam = find_vertical_seam(cumulativeEnergyMap);
    [no_row,no_column,dim] = size(im);
    
    for j=1:3
      for i=1:no_row
         if verticalSeam(i) == 1
            increasedColorImg(i,:,j)=[im(i,1,j) im(i,1:no_column,j)];
         elseif verticalSeam(i) == no_column
            increasedColorImg(i,:,j)=[im(i,1:no_column,j) im(i,no_column,j)];
         else
            increasedColorImg(i,:,j)=[im(i,1:verticalSeam(i),j) 0.5*(im(i,verticalSeam(i),j)+im(i,verticalSeam(i)+1,j)) im(i,verticalSeam(i)+1:no_column,j)];
         end
      end
    end
    imshow(increasedColorImg);
    increasedEnergyImg = energy_img(increasedColorImg);
end