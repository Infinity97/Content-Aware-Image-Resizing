function [reducedColorImg,reducedEnergyImg] = decrease_height(im,energyImg)
  cumulativeEnergyMap = cumulative_min_energy_map(energyImg,'HORIZONTAL');
  horizontalSeam = find_horizontal_seam(cumulativeEnergyMap);
  view_seam(im,horizontalSeam,'HORIZONTAL');
  [no_row,no_column,dim] = size(im);
  for j = 1:3 
    for i = 1:no_column
      if horizontalSeam(i) == 1
          reducedColorImg(1:no_row-1,i,j) = im(2:no_row,i,j); 
      elseif horizontalSeam(i) == no_row
          reducedColorImg(1:no_row-1,i,j) = im(1:no_row-1,i,j);
      else   
          reducedColorImg(1:horizontalSeam(i)-1,i,j) = im(1:horizontalSeam(i)-1,i,j);
          reducedColorImg(horizontalSeam(i):no_row-1,i,j) = im(horizontalSeam(i)+1:no_row,i,j);
      end
    end
  end
  imshow(reducedColorImg);
  reducedEnergyImg = energy_img(reducedColorImg);
end