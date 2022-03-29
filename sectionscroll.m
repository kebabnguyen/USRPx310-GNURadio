function freesections = sectionscroll(occupiedbins,sections)
% comb through sections to find ones that don't overlap w occupiedbins
%   we have a vector of the occupied bins and a table of the section blocks
% we wish to get rid of the blocks that overlap with the occupied bins
% 
%go through each row of the section table
% if there's any intersect with occupied bins, then mark it zero in our
% vector keeping track of free row indices
%at the end, we tare down to sections that have no overlap with occupied
%bins


for i = 1:length(sections(1,:))
    if(isempty(intersect(sections(i,:),occupiedbins))) %if there's no intersect
        freeind(i,1) = i;
    else
        freeind(i,:) = 0;
    end
end
frijole = sections(nonzeros(freeind),:);
freesections = frijole;

end