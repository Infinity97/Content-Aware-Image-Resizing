function verticalSeam = find_vertical_seam(cumulativeEnergyMap)
[no_row,no_column]=size(cumulativeEnergyMap);
[min_value,c] = min(cumulativeEnergyMap(no_row,:));
verticalSeam(no_row) = c;
for i=no_row-1:-1:1
    
        if verticalSeam(i+1) == 1
            V = [Inf,cumulativeEnergyMap(i,verticalSeam(i+1)),cumulativeEnergyMap(i,verticalSeam(i+1)+1)];
        elseif verticalSeam(i+1) == no_column
            V = [cumulativeEnergyMap(i,verticalSeam(i+1)-1),cumulativeEnergyMap(i,verticalSeam(i+1)),Inf];
        else
            V = [cumulativeEnergyMap(i,verticalSeam(i+1)-1),cumulativeEnergyMap(i,verticalSeam(i+1)),cumulativeEnergyMap(i,verticalSeam(i+1)+1)];
        end
        [min_value,min_index] = min(V);
        if min_index == 1
            c = verticalSeam(i+1)-1;
        elseif min_index == 3
            c = verticalSeam(i+1)+1;
        else 
            c = verticalSeam(i+1);
        end
        verticalSeam(i)=c;
end
end
