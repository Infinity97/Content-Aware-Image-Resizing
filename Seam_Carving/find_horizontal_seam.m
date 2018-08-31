function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
[no_row,no_column]=size(cumulativeEnergyMap);
[min_value,r] = min(cumulativeEnergyMap(:,no_column));
horizontalSeam(no_column) = r;
for j = no_column-1:-1:1
    
        if horizontalSeam(j+1) == 1
            V = [Inf,cumulativeEnergyMap(horizontalSeam(j+1),j),cumulativeEnergyMap(horizontalSeam(j+1)+1,j)];
        elseif horizontalSeam(j+1) == no_row
            V = [cumulativeEnergyMap(horizontalSeam(j+1)-1,j),cumulativeEnergyMap(horizontalSeam(j+1),j),Inf];
        else
            V = [cumulativeEnergyMap(horizontalSeam(j+1)-1,j),cumulativeEnergyMap(horizontalSeam(j+1),j),cumulativeEnergyMap(horizontalSeam(j+1)+1,j)];
        end
        [min_value,min_index] = min(V);
        if min_index == 1
            c = horizontalSeam(j+1)-1;
        elseif min_index == 3
            c = horizontalSeam(j+1)+1;
        else 
            c = horizontalSeam(j+1);
        end
        horizontalSeam(j)=c;
end
end
