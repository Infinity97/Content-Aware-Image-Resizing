function [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg)
  cumulativeEnergyMap = cumulative_min_energy_map(energyImg,'VERTICAL');
  verticalSeam = find_vertical_seam(cumulativeEnergyMap);
  view_seam(im,verticalSeam,'VERTICAL');
  [no_row,no_column,dim] = size(im);
  for j = 1:3 
    for i = 1:no_row
      if verticalSeam(i) == 1
          reducedColorImg(i,1:no_column-1,j) = im(i,2:no_column,j); 
      elseif verticalSeam(i) == no_column
          reducedColorImg(i,1:no_column-1,j) = im(i,1:no_column-1,j);
      else   
          reducedColorImg(i,1:verticalSeam(i)-1,j) = im(i,1:verticalSeam(i)-1,j);
          reducedColorImg(i,verticalSeam(i):no_column-1,j) = im(i,verticalSeam(i)+1:no_column,j);
      end
    end
  end
  imshow(reducedColorImg);
  reducedEnergyImg = energy_img(reducedColorImg);
end