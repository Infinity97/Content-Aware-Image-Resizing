function cumulativeEnergyMap = cumulative_min_energy_map(energyImg,seamDirection)
  if strcmp(seamDirection,'VERTICAL')
    [no_row,no_column]=size(energyImg);
    cumulativeEnergyMap = zeros(no_row,no_column);
    cumulativeEnergyMap(1,:) = energyImg(1,:);
    for r=2:no_row
      for c=1:no_column
           if c == 1 
            cumulativeEnergyMap(r,c)= energyImg(r,c)+min([cumulativeEnergyMap(r-1,c),cumulativeEnergyMap(r-1,c+1)]);
           elseif c == no_column
            cumulativeEnergyMap(r,c)= energyImg(r,c)+min([cumulativeEnergyMap(r-1,c-1),cumulativeEnergyMap(r-1,c)]);
           else
            cumulativeEnergyMap(r,c)= energyImg(r,c)+min([cumulativeEnergyMap(r-1,c-1),cumulativeEnergyMap(r-1,c),cumulativeEnergyMap(r-1,c+1)]);
           end
      end
    end
  elseif strcmp(seamDirection,'HORIZONTAL')
    [no_row,no_column]=size(energyImg);
    cumulativeEnergyMap = zeros(no_row,no_column);
    cumulativeEnergyMap(:,1) = energyImg(:,1);
    for c=2:no_column
      for r=1:no_row
           if r == 1 
            cumulativeEnergyMap(r,c)= energyImg(r,c)+min([cumulativeEnergyMap(r,c-1),cumulativeEnergyMap(r+1,c-1)]);
           elseif r == no_row
            cumulativeEnergyMap(r,c)= energyImg(r,c)+min([cumulativeEnergyMap(r,c-1),cumulativeEnergyMap(r-1,c-1)]);
           else
            cumulativeEnergyMap(r,c)= energyImg(r,c)+min([cumulativeEnergyMap(r-1,c-1),cumulativeEnergyMap(r,c-1),cumulativeEnergyMap(r+1,c-1)]);
           end
        end
      end     
  end
end
