function [increasedColorImg,increasedEnergyImg] = increase_height(im,energyImg)
  cumulativeEnergyMap = cumulative_min_energy_map(energyImg,'HORIZONTAL');
  horizontalSeam = find_horizontal_seam(cumulativeEnergyMap);
  [no_row,no_column] = size(im);
   for j=1:3
     for i=1:no_column
        if horizontalSeam(i) == 1
            A = im(1,i,j);
            B = im(1:no_row,i,j);
            C = vertcat(A,B);
           increasedColorImg(:,i,j)= C(:,i,j);
        elseif horizontalSeam(i) == no_row
            A = im(1:no_row,i,j);
            B = im(no_row,i,j);
            C = vertcat(A,B);
           increasedColorImg(:,i,j)= C(:,i,j);
        else
            A = im(1:horizontalSeam(i),i,j);
            B = 0.5*(im(horizontalSeam(i),i,j)+im(horizontalSeam(i)+1,i,j));
            D = im(horizontalSeam(i)+1:no_row,i,j);
            C = vertcat(A,B,D);
           increasedColorImg(:,i,j)= C(:,i,j);
        end
      end
   end
    increasedEnergyImg = energy_img(increasedColorImg);
end