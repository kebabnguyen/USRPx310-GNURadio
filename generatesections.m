function [sectiontable] = generatesections(fftlen,numsections)
%UNTITLED break up fft bins into smaller sections
%   Detailed explanation goes here
sectionlen = fftlen/numsections;
sections = zeros(sectionlen,numsections);
for i = 1:numsections
    sections(i,:) =  (sectionlen*(i-1)+1:sectionlen*i);
end
sectiontable = sections; %each section's bins are stored in sectionable(i,:)
end