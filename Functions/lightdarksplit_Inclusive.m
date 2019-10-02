%takes in a vector and outputs all indices for daytime values and nighttime
%values
%based on 9AM-11PM light ON
%does not exclude first 2 hours of each phase

function [dayIndices, nightIndices] = lightdarksplit_Inclusive(timeVector)

nightIndices = [find(timeVector>23) find(timeVector<9)];
dayIndices = intersect(find(timeVector>9),find(timeVector<23));

end